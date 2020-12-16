import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/ui/views/drawguess/chat_screen.dart';
import 'package:provider_start/ui/views/drawguess/draw_view_model.dart';
import 'package:provider_start/ui/views/drawguess/signature_painter.dart';
import 'package:stacked/stacked.dart';

import 'draw_color.dart';

//绘制布局页面
class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DrawViewModel(),
        onModelReady: (DrawViewModel model) => model.init(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('你画我猜'),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.call_missed_outgoing),
                    onPressed: () {
                      //撤销一步
                      model.undoDate();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.call_missed),
                    onPressed: () {
                      //反撤销
                      model.reverseUndoDate();
                    },
                  ),
                ],
              ),
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffF5CBFF), Color(0xffBFABFF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(child: _DrawWidget(),flex: 2,),
                    _userList(),
                    Expanded(
                      flex: 1,
                      child: chatScreen(),
                    )
                  ],
                ),
              ),
            ));
  }

  InkWell buildInkWell(DrawViewModel model, double size) {
    return InkWell(
      onTap: () {
        model.pentSize = size;
        //drawProvider.notifyListeners();
      },
      child: Container(
        width: 40,
        height: 40,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: pintColor[model.pentColor],
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(size / 2)),
              //设置四周边框
              border: model.pentSize == size
                  ? Border.all(width: 1, color: Colors.black)
                  : null,
            ),
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}

class _DrawWidget extends ViewModelWidget<DrawViewModel> {
  //var totalHeight = ScreenUtil().setHeight(620);

  @override
  Widget build(BuildContext context, DrawViewModel model) {
    return Stack(
      children: [
        GestureDetector(
          //按下
          onPanDown: (DragDownDetails details) {
            model.sendDraw(details.localPosition);
          },
          onPanStart: (DragStartDetails details) {
            model.sendDraw(details.localPosition);
          },
          onPanUpdate: (DragUpdateDetails details) {
            /*var offset = Offset(
                details.localPosition.dx,
                details.localPosition.dy > totalHeight
                    ? totalHeight
                    : details.localPosition.dy)*/;
            model.sendDraw(details.localPosition);
          },
          //抬起来
          onPanEnd: (DragEndDetails details) {
            model.sendDrawNull();
          },

          child: Container(
           // height: totalHeight,
           // width: ScreenUtil().screenWidth,
            color: Colors.white, // 画板所在颜色
          ),
        ),
        CustomPaint(
          painter: SignaturePainter(model.pointsList),
        ),
      ],
    );
  }
}

class _userList extends ViewModelWidget<DrawViewModel> {
  Widget _item(User user) {
    return InkWell(
      onTap: () {
        showToast('点击用户:${user.id}');
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              user.avatar,
            ),
            radius: ScreenUtil().setWidth(45),
          ),
          Text(user.nickname)
        ],
      ),
    );
  }

  Widget _buildRow(DrawViewModel model) {
    var children = List<Widget>(model.users.length);
    for (var i = 0; i < model.users.length; i++) {
      children[i] = _item(model.users[i]);
    }
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setWidth(10), bottom: ScreenUtil().setWidth(10)),
      child: Wrap(
        spacing: ScreenUtil().setWidth(30),
        runSpacing: ScreenUtil().setWidth(10),
        alignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context, DrawViewModel model) {
    return _buildRow(model);
  }
}
