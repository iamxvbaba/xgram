import 'dart:async';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider_start/constant/constant.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/ui/views/chat_screen/sp_util.dart';
import 'emoji_widget.dart';
import 'extra_widget.dart';
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

  double _softKeyHeight = SpUtil.getDouble(Constant.SP_KEYBOARD_HEGIHT, 0);

  final GlobalKey globalKey = GlobalKey();

  bool mBottomLayoutShow = false;

  bool mAddLayoutShow = false;

  bool mEmojiLayoutShow = false;

  KeyboardVisibilityNotification _keyboardVisibility =
      KeyboardVisibilityNotification();

  StreamSubscription streamSubscription;

  void _getWH() {
    if (globalKey == null) return;
    if (globalKey.currentContext == null) return;
    if (globalKey.currentContext.size == null) return;
  }

  @override
  void didChangeMetrics() {
    final mediaQueryData = MediaQueryData.fromWindow(ui.window);
    final keyHeight = mediaQueryData?.viewInsets?.bottom;
    if (keyHeight != 0) {
      _softKeyHeight = keyHeight;
      print('-------->keyHeight:$keyHeight');
    }
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
    setState(() {
      this.mCurrentType = ContentType.normalText;
      mBottomLayoutShow = false;
      mAddLayoutShow = false;
      mEmojiLayoutShow = false;
    });
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

    _keyboardVisibility.addNewListener(
      onChange: (bool visible) {
        if (visible) {
          mBottomLayoutShow = true;
          if (mEmojiLayoutShow) {
            mCurrentType = ContentType.normalText;
            setState(() {});
          } else {
            setState(() {});
          }
        } else {
          if (mBottomLayoutShow) {
            if (mAddLayoutShow) {
            } else {
              if (!mEmojiLayoutShow) {
                mBottomLayoutShow = false;
                setState(() {});
              }
            }
          }
        }
      },
    );
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
    requestPermission();

    return Container(
      // height: keyHeight+60,
      color: Color(0xffF8F8F8),
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              buildLeftButton(),
              Expanded(child: buildInputButton()),
              buildEmojiButton(),
              buildRightButton(),
            ],
          ),
          _buildBottomContainer(child: _buildBottomItems()),
        ],
      ),
    );
  }

  Widget buildLeftButton() {
    return mCurrentType == ContentType.voice ? mKeyBoardButton() : mRecordButton();
  }

  Widget mRecordButton() {
    return ImageButton(
      onPressed: () {
        mCurrentType = ContentType.voice;
        hideSoftKey();
        mBottomLayoutShow = false;
        mEmojiLayoutShow = false;
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
            borderRadius: BorderRadius.all(const Radius.circular(5.0)),
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
    return mCurrentType != ContentType.emoji ? mEmojiButton() : mEmojiKeyBoardButton();
  }

  Widget mEmojiButton() {
    return ImageButton(
      onPressed: () {
        mCurrentType = ContentType.emoji;
        _getWH();
        setState(() {
          mBottomLayoutShow = false;
          mEmojiLayoutShow = true;
        });
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
        this.mCurrentType = ContentType.normalText;
        mBottomLayoutShow = true;
        mEmojiLayoutShow = false;
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
        final sendButton = buildSend();
        final extraButton = ImageButton(
            image: AssetImage(Constant.ASSETS_IMG + 'ic_add.png'),
            onPressed: () {
              mCurrentType = ContentType.extra;
              if (mBottomLayoutShow) {
                if (mAddLayoutShow) {
                  showSoftKey();
                  mAddLayoutShow = false;
                  setState(() {});
                } else {
                  hideSoftKey();
                  mAddLayoutShow = true;
                  setState(() {});
                }
              } else {
                if (focusNode.hasFocus) {
                  hideSoftKey();
                  Future.delayed(const Duration(milliseconds: 50), () {
                    setState(() {
                      mBottomLayoutShow = true;
                      mAddLayoutShow = true;
                    });
                  });
                } else {
                  mBottomLayoutShow = true;
                  mAddLayoutShow = true;
                  setState(() {});
                }
              }
            });
        var crossFadeState =
            checkShowSendButton(mEditController.text)
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond;
        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: crossFadeState,
          firstChild: sendButton,
          secondChild: extraButton,
        );
      },
    );
  }

  Widget buildSend() {
    return Container(
      width: 60,
      height: 30,
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        color: Color(0xffFF8200),
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        disabledColor: Color(0xffFFD8AF),
        elevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        onPressed: () {
          mCurrentType = ContentType.normalText;
          widget.onSendCallBack?.call(mEditController.text.trim());
          mEditController.clear();
        },
        child: Text(
          '发送',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  bool checkShowSendButton(String text) {
    if (mCurrentType == ContentType.voice) {
      return false;
    }
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


  Widget _buildBottomContainer({Widget child}) {
    return Visibility(
      visible: mBottomLayoutShow,
      child: Container(
        key: globalKey,
        child: child,
        height: mCurrentType==ContentType.extra?_softKeyHeight:0,
      ),
    );
  }

  Widget _buildBottomItems() {
    if (mCurrentType == ContentType.extra) {
      return Visibility(
          visible: mAddLayoutShow,
          child: DefaultExtraWidget(onImageSelectBack: (value) {
            widget.onImageSelectCallBack?.call(value);
          }));
    } else if (mCurrentType == ContentType.emoji) {
      return Visibility(
        visible: mEmojiLayoutShow,
        child: EmojiWidget(onEmojiClockBack: (value) {
          if (0 == value) {
            mEditController.clear();
          } else {
            mEditController.text =
                mEditController.text + String.fromCharCode(value);
          }
        }),
      );
    } else {
      return Container();
    }
  }
}

class ChangeChatTypeNotification extends Notification {
  final String type;

  ChangeChatTypeNotification(this.type);
}
