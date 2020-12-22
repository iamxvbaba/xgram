import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pbenum.dart';
import 'package:provider_start/core/proto/protobuf_gen/draw.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/event_hub/draw.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:flutter/widgets.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;

//基础实体
class DrawEntity {
  Offset offset;
  String color;
  double strokeWidth;

  DrawEntity(this.offset, {this.color = 'default', this.strokeWidth = 5.0});
}

var roomID = $fixnum.Int64(1);

class DrawService {
  final _log = Logger('DrawService');
  final DrawEvent _eventBus = locator<DrawEvent>();
  final SocketBloc _socket = locator<SocketBloc>();

  static DrawService get instance => _getInstance();
  static DrawService _instance;

  static DrawService _getInstance() {
    _instance ??= DrawService._();
    return _instance;
  }

  UserList _userList;
  List<User> get users => _userList.users;

  DrawService._() {
    _eventBus.eventBus.on<DrawParam>().listen((drawParam) {
      switch (drawParam.op) {
        case DrawOP.p_draw:
          //正在连续绘制
          if (points.isEmpty) {
            points.add(<DrawEntity>[]);
            points.add(<DrawEntity>[]);
          }
          pentColor = drawParam.pentColor;
          pentSize = drawParam.pentSize;
          //添加绘制
          points[points.length - 2].add(DrawEntity(
              Offset(
                  drawParam.dx / drawParam.scaleWidth * ScreenUtil().scaleWidth,
                  drawParam.dy / drawParam.scaleHeight * ScreenUtil().scaleHeight),
              color: pentColor,
              strokeWidth: pentSize));
          break;
        case DrawOP.p_drawNull:
          //手抬起，添加占位
          //添加绘制标识
          points.add(<DrawEntity>[]);
          break;
        case DrawOP.p_clear:
          //清空画板
          points.clear();
          break;
        case DrawOP.p_undo:
          //撤销，缓存到撤销容器
          undoPoints.add(points[points.length - 3]); //添加到撤销的数据里
          points.removeAt(points.length - 3); //移除数据
          //通知更新
          break;
        case DrawOP.p_reverseUndo:
          //反撤销数据
          points.insert(points.length - 2, undoPoints.removeLast());
          break;
        case DrawOP.p_userChange:
          _userList = drawParam.list;
          break;
        case DrawOP.p_msg:
          sendOrReceiveMessage(drawParam.msg, false,roomID: roomID);
          break;
      }
      // 回调 通知更新
      setState();
    });
  }

  Function _notify;

  void setNotify(Function f) {
    _notify = f;
  }

  List<List<DrawEntity>> undoPoints = <List<DrawEntity>>[]; // 撤销的数据
  List<List<DrawEntity>> points = <List<DrawEntity>>[]; // 存储要画的数据
  List<DrawEntity> pointsList = <DrawEntity>[]; //预处理的数据，避免绘制时处理卡顿
  String pentColor = 'default'; //默认颜色
  double pentSize = 5; //默认字体大小

  Map<$fixnum.Int64, List<Message>> _msgMap = Map<$fixnum.Int64, List<Message>>();

  // 返回msg
  List<Message> getMsgs({$fixnum.Int64 roomID}) {
    return _msgMap[roomID];
  }

  Future<void> sendOrReceiveMessage(Message msg, bool send,{$fixnum.Int64 roomID}) async {
    roomID ??= roomID;
    if (_msgMap[roomID] == null) {
      _msgMap[roomID] = <Message>[];
    }
    _msgMap[roomID].insert(0,msg);

    if (send) {
      //发送绘制消息给服务端
      DrawParam param = DrawParam.create();
      param.roomID = roomID;
      param.op = DrawOP.p_msg;
      param.msg = msg;
      Response resp = await _socket.send(OP.drawS, param, _convertResponse);
      if (resp.code != 200) {
        showToast('发送答案${resp.msg}');
        return null;
      }
    }
  }
  Future<void> joinRoom({$fixnum.Int64 rid}) async {
    try {
      ID id = ID.create();
      if (rid != null) {
        id.ids.add(rid);
      } else {
        id.ids.add(roomID);
      }
      Response resp = await _socket.send(OP.roomJoin, id, _convertResponse);
      if (resp.code != 200) {
        showToast('加入房间失败:${resp.msg}');
        return null;
      }
    } catch (e) {
      print('什么叼错误$e');
    }
  }

  void exitRoom({$fixnum.Int64 rid}) async {
    ID id = ID.create();
    if (rid != null) {
      id.ids.add(rid);
    } else {
      id.ids.add(roomID);
    }
    Response resp = await _socket.send(OP.roomExit, id, _convertResponse);
    if (resp.code != 200) {
      showToast('退出房间失败:${resp.msg}');
      return null;
    }
  }

  void _update() {
    pointsList = <DrawEntity>[];
    for (var i = 0; i < points.length - 1; i++) {
      pointsList.addAll(points[i]);
      pointsList.add(null);
    }
  }

  void setState() {
    _update();
    if (_notify != null) {
      _notify();
    }
  }

  //清除数据
  Future<void> clear() async {
    //清除数据
    points.clear();
    //通知更新
    setState();
    //发送绘制消息给服务端
    DrawParam param = DrawParam.create();
    param.roomID = roomID;
    param.op = DrawOP.p_clear;
    Response resp = await _socket.send(OP.drawS, param, _convertResponse);
    if (resp.code != 200) {
      showToast('发送draw事件失败:${resp.msg}');
      return null;
    }
  }

  //绘制数据
  Future<void> sendDraw(Offset localPosition) async {
    if (points.length == 0) {
      points.add(List<DrawEntity>());
      points.add(List<DrawEntity>());
    }
    //添加绘制
    points[points.length - 2].add(
        DrawEntity(localPosition, color: pentColor, strokeWidth: pentSize));

    //通知更新
    setState();

    //发送绘制消息给服务端
    DrawParam param = DrawParam.create();
    param.roomID = roomID;
    param.op = DrawOP.p_draw;
    param.pentColor = pentColor;
    param.pentSize = pentSize;
    param.dx = localPosition.dx;
    param.dy = localPosition.dy;
    param.scaleHeight = ScreenUtil().scaleHeight; // 传比例是为了屏幕大小适配
    param.scaleWidth = ScreenUtil().scaleWidth;

    Response resp = await _socket.send(OP.drawS, param, _convertResponse);
    if (resp.code != 200) {
      showToast('发送draw事件失败:${resp.msg}');
      return null;
    }
  }

  //绘制Null数据隔断标识
  Future<void> sendDrawNull() async {
    //添加绘制标识
    points.add(List<DrawEntity>());
    //通知更新
    setState();

    //发送绘制消息给服务端
    DrawParam param = DrawParam.create();
    param.roomID = roomID;
    param.op = DrawOP.p_drawNull;
    Response resp = await _socket.send(OP.drawS, param, _convertResponse);
    if (resp.code != 200) {
      showToast('发送draw事件失败:${resp.msg}');
      return null;
    }
  }

  //撤销一条数据
  Future<void> undoDate() async {
    //撤销，缓存到撤销容器
    undoPoints.add(points[points.length - 3]); //添加到撤销的数据里
    points.removeAt(points.length - 3); //移除数据
    setState();
    DrawParam param = DrawParam.create();
    param.roomID = roomID;
    param.op = DrawOP.p_undo;
    Response resp = await _socket.send(OP.drawS, param, _convertResponse);
    if (resp.code != 200) {
      showToast('发送draw事件失败:${resp.msg}');
      return null;
    }
  }

  //反撤销一条数据
  Future<void> reverseUndoDate() async {
    var ss = undoPoints.removeLast();
    points.insert(points.length - 2, ss);

    setState();
    DrawParam param = DrawParam.create();
    param.roomID = roomID;
    param.op = DrawOP.p_reverseUndo;
    Response resp = await _socket.send(OP.drawS, param, _convertResponse);
    if (resp.code != 200) {
      showToast('发送draw事件失败:${resp.msg}');
      return null;
    }
  }

  Response _convertResponse(Response resp) {
    return resp;
  }
}
