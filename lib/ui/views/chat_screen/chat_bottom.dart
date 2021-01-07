import 'dart:async';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider_start/constant/constant.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'image_button.dart';
import 'record_button.dart';

ContentType _initType = ContentType.normalText;

typedef OnSend = void Function(String text);
typedef OnImageSelect = void Function(File mFile);
typedef OnAudioCallBack = void Function(File mAudioFile, int duration);

class ChatBottomInputWidget extends StatefulWidget {
  final OnSend onSendCallBack;

  final OnImageSelect onImageSelectCallBack;

  final OnAudioCallBack onAudioCallBack;

  final Stream shouldTriggerChange;

  const ChatBottomInputWidget({
    Key key,
    @required this.shouldTriggerChange,
    this.onSendCallBack,
    this.onImageSelectCallBack,
    this.onAudioCallBack,
  }) : super(key: key);

  @override
  _ChatBottomInputWidgetState createState() => _ChatBottomInputWidgetState();
}

class _ChatBottomInputWidgetState extends State<ChatBottomInputWidget>
    with WidgetsBindingObserver, TickerProviderStateMixin {

  ContentType mCurrentType = _initType;

  FocusNode focusNode = FocusNode();

  TextEditingController mEditController = TextEditingController();

  StreamController<String> inputContentStreamController =
      StreamController.broadcast();

  Stream<String> get inputContentStream => inputContentStreamController.stream;

  final GlobalKey globalKey = GlobalKey();

  /*
  KeyboardVisibilityNotification _keyboardVisibility =
      KeyboardVisibilityNotification();
  */
  StreamSubscription streamSubscription;

  void _getWH() {
    if (globalKey == null) return;
    if (globalKey.currentContext == null) return;
    if (globalKey.currentContext.size == null) return;
  }

  @override
  void didChangeMetrics() {
    // 此处得到键盘高度
    final mediaQueryData = MediaQueryData.fromWindow(ui.window);
    final keyHeight = mediaQueryData?.viewInsets?.bottom;
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
    mEditController.addListener(() {
      inputContentStreamController.add(mEditController.text);
    });

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
        await PermissionHandler().requestPermissions(
            [PermissionGroup.storage, PermissionGroup.microphone]);

    // 申请结果
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);

    if (permission == PermissionStatus.granted) {
      //  Fluttertoast.showToast(msg: "权限申请通过");

    } else {
      //Fluttertoast.showToast(msg: "权限申请被拒绝");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF8F8F8),
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: <Widget>[
          // 各种选项
          _buildExtraContainer(child: _buildBottomItems()),
          Row(
            children: <Widget>[
              buildLeftButton(),
              Expanded(child: buildInputButton()),
              buildEmojiButton(),
              buildRightButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLeftButton() {
    return mCurrentType == ContentType.voice
        ? mKeyBoardButton()
        : mRecordButton();
  }

  Widget mRecordButton() {
    return ImageButton(
      onPressed: () {
        hideSoftKey();
        setState(() {});
      },
      image: AssetImage(Constant.ASSETS_IMG + 'ic_audio.png'),
    );
  }

  Widget mKeyBoardButton() {
    return ImageButton(
      onPressed: () {
        mCurrentType = ContentType.normalText;
        showSoftKey();
        setState(() {});
      },
      image: AssetImage(Constant.ASSETS_IMG + 'ic_keyboard.png'),
    );
  }

  Widget mVoiceButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RecordButton(onAudioCallBack: (value, duration) {
        widget.onAudioCallBack?.call(value, duration);
      }),
    );
  }

  Widget buildInputButton() {
    final voiceButton = mVoiceButton(context);
    final inputButton = Container(
      // height: 40,
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
            child: voiceButton,
            offstage: mCurrentType != ContentType.voice,
          ),
          Offstage(
            child: inputButton,
            offstage: mCurrentType == ContentType.voice,
          ),
        ],
      ),
    );
  }

  Widget buildEmojiButton() {
    return mCurrentType != ContentType.emoji
        ? mEmojiButton()
        : mEmojiKeyBoardButton();
  }

  Widget mEmojiButton() {
    return ImageButton(
      onPressed: () {
        mCurrentType = ContentType.emoji;
        _getWH();
        setState(() {});
        hideSoftKey();
        _getWH();
      },
      image: AssetImage(Constant.ASSETS_IMG + 'ic_emoji.png'),
    );
  }

  Widget mEmojiKeyBoardButton() {
    return ImageButton(
      onPressed: () {
        _getWH();
        mCurrentType = ContentType.normalText;

        setState(() {});
        showSoftKey();
      },
      image: AssetImage(Constant.ASSETS_IMG + 'ic_keyboard.png'),
    );
  }

  Widget buildRightButton() {
    return StreamBuilder<String>(
      stream: inputContentStream,
      builder: (context, snapshot) {
        var crossFadeState;
        if (!snapshot.hasData) {
          crossFadeState =  CrossFadeState.showFirst;
        } else {
          crossFadeState = snapshot.data?.trim()?.isNotEmpty
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond;
        }

        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: crossFadeState,
          firstChild: Container(
            width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setWidth(80),
            child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  mCurrentType = ContentType.normalText;
                  widget.onSendCallBack?.call(mEditController.text.trim());
                  mEditController.clear();
                }),
          ),
          secondChild: ImageButton(
              image: AssetImage(Constant.ASSETS_IMG + 'ic_add.png'),
              onPressed: () {
                hideSoftKey(); // 隐藏软
              }),
        );
      },
    );
  }


  bool checkShowSendButton(String text) {
    if (text.trim().isNotEmpty) {
      return true;
    }
    return false;
  }

  void showSoftKey() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void hideSoftKey() {
    focusNode.unfocus();
  }

  Widget _buildExtraContainer({Widget child}) {
    return Visibility(
      visible: false, //mBottomLayoutShow,
      child: Container(
        key: globalKey,
        child: child,
      ),
    );
  }

  Widget _buildBottomItems() {
    return Container(
      child: Row(
        children: [
          Text('1'),
          Text('2'),
        ],
      ),
    );
  }
}

class ChangeChatTypeNotification extends Notification {
  final String type;

  ChangeChatTypeNotification(this.type);
}
