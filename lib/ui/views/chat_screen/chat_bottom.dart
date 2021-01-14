import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/ui/views/chat_screen/chat_screen_view_model.dart';

ContentType _initType = ContentType.normalText;

typedef OnSend = void Function(String text);
typedef OnImageSelect = void Function(String path);

class ChatBottomInputWidget extends StatefulWidget {
  final OnSend onSendCallBack;

  final Stream shouldTriggerChange;

  final ChatScreenViewModel model;

  final OnImageSelect onImageSelectBack;

  const ChatBottomInputWidget({
    Key key,
    @required this.model,
    @required this.shouldTriggerChange,
    @required this.onImageSelectBack,
    this.onSendCallBack,
  }) : super(key: key);

  @override
  _ChatBottomInputWidgetState createState() => _ChatBottomInputWidgetState();
}

class _ChatBottomInputWidgetState extends State<ChatBottomInputWidget>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  ContentType mCurrentType = _initType;

  FocusNode focusNode = FocusNode();

  TextEditingController mEditController = TextEditingController();

  final GlobalKey globalKey = GlobalKey();
  final ImagePicker _picker = ImagePicker();

  /*
  KeyboardVisibilityNotification _keyboardVisibility =
      KeyboardVisibilityNotification();
  */
  StreamSubscription streamSubscription;

  @override
  void didChangeMetrics() {
    // 此处得到键盘高度
    // final mediaQueryData = MediaQueryData.fromWindow(ui.window);
    // final keyHeight = mediaQueryData?.viewInsets?.bottom;
  }

  @override
  void didUpdateWidget(ChatBottomInputWidget old) {
    super.didUpdateWidget(old);
    if (widget.shouldTriggerChange != old.shouldTriggerChange) {
      streamSubscription.cancel();
      streamSubscription =
          widget.shouldTriggerChange.listen((_) => hideBottomLayout());
    }
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }

  void hideBottomLayout() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    streamSubscription =
        widget.shouldTriggerChange.listen((_) => hideBottomLayout());
    WidgetsBinding.instance.addObserver(this);

    /*
    _keyboardVisibility.addNewListener(
      onChange: (bool visible) {

      },
    );
     */
  }

  Future requestPermission() async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    // 申请结果
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      showToast('权限申请被拒绝');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF8F8F8),
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        children: <Widget>[
          imageButton(widget.model),
          Expanded(child: buildInputButton()),
          sendButton(),
        ],
      ),
    );
  }

  Widget buildInputButton() {
    final inputButton = Container(
      constraints: BoxConstraints(
        maxHeight: 80.0,
        minHeight: 40.0,
      ),
      child: TextField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        //minLines: 1,
        style: TextStyle(fontSize: 16),
        focusNode: focusNode,
        controller: mEditController,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
    );

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Stack(
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Offstage(
            child: inputButton,
            offstage: mCurrentType == ContentType.voice,
          ),
        ],
      ),
    );
  }

  Widget imageButton(ChatScreenViewModel model) {
    return IconButton(
        icon: Icon(Icons.add_a_photo),
        iconSize: ScreenUtil().setWidth(60),
        onPressed: () {
          // 请求权限
          requestPermission();
          // 获取图片地址
          _onImageButtonPressed(ImageSource.gallery)
              .then((PickedFile pickedFile) async {
            String path = await _uploadImage(pickedFile.path);
            widget.onImageSelectBack(path);
          });
        });
  }

  Future<PickedFile> _onImageButtonPressed(ImageSource source) async {
    return await _picker.getImage(
      source: source,
    );
  }

  //上传图片到服务器
  Future<String> _uploadImage(String path) async {
    FormData formData = FormData.fromMap({
      //"": "", //这里写其他需要传递的参数
      "file": await MultipartFile.fromFile(path)
    });
    Dio dio = new Dio();
    var respone = await dio
        .post<String>('http://192.168.101.13:7181/file/upload', data: formData);
    if (respone.statusCode != 200) {
      showToast('图片上传失败:${respone.data}');
      return null;
    }
    Map<String, dynamic> data = json.decode(respone.data);

    return data['filepath'];
  }

  /*
  Widget imageTestButton(ChatScreenViewModel model) {
    return IconButton(
        icon: Icon(Icons.add),
        iconSize: ScreenUtil().setWidth(60),
        onPressed: () {
          requestPermission();
          model.pushSelectImage();
        });
  }*/

  Widget sendButton() {
    return IconButton(
        icon: Icon(Icons.send),
        iconSize: ScreenUtil().setWidth(60),
        onPressed: () {
          mCurrentType = ContentType.normalText;
          var msg = mEditController.text.trim();
          if (msg.isEmpty) {
            return;
          }
          widget.onSendCallBack?.call(msg);
          mEditController.clear();
        });
  }

  void showSoftKey() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void hideSoftKey() {
    focusNode.unfocus();
  }
}

class ChangeChatTypeNotification extends Notification {
  final String type;

  ChangeChatTypeNotification(this.type);
}
