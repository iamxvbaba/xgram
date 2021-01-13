import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/ui/views/chat_screen/chat_screen_view_model.dart';

ContentType _initType = ContentType.normalText;

typedef OnSend = void Function(String text);
typedef OnImageSelect = void Function(File mFile);
typedef OnAudioCallBack = void Function(File mAudioFile, int duration);

class ChatBottomInputWidget extends StatefulWidget {
  final OnSend onSendCallBack;

  final Stream shouldTriggerChange;

  final ChatScreenViewModel model;

  const ChatBottomInputWidget({
    Key key,
    @required this.model,
    @required this.shouldTriggerChange,
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
    print('申请权限');
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    // 申请结果
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission == PermissionStatus.granted) {
      showToast('权限申请通过');
    } else {
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
          buildAddButton(widget.model),
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

  Widget buildAddButton(ChatScreenViewModel model) {
    return IconButton(
        icon: Icon(Icons.add_a_photo),
        iconSize: ScreenUtil().setWidth(60),
        onPressed: () {
          requestPermission();
          model.pushSelectImage();
        });
  }


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
