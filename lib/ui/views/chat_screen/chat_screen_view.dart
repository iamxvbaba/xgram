import 'dart:ffi';
import 'dart:io';
import 'dart:ui' as ui show Codec, FrameInfo, Image;

import 'package:flutter/material.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/ui/views/chat_screen/chat_screen_view_model.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:stacked/stacked.dart';
import 'package:fixnum/fixnum.dart';

import 'chat_bottom.dart';
import 'expanded_viewport.dart';
import 'message_item.dart';

class ChatScreenPage extends StatefulWidget {
  ChatScreenPage({Key key, this.userProfileId}) : super(key: key);

  final String userProfileId;

  @override
  _ChatScreenPageState createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    super.initState();
  }

  BorderRadius getBorder(bool myMessage) {
    return BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomRight: myMessage ? Radius.circular(0) : Radius.circular(20),
      bottomLeft: myMessage ? Radius.circular(20) : Radius.circular(0),
    );
  }

  Future<bool> _onWillPop(ChatScreenViewModel model) async {
    FocusScope.of(context).requestFocus(FocusNode());
    model.changeNotifier.sink.add(null);
    return true;
  }

  Message buildMsgContent(String value, Int64 sender, Int64 receiver,
      {ContentType type = ContentType.normalText}) {
    Message message = Message.create();
    message.senderID = sender;
    message.userID = receiver;
    message.body = MessageBody.create();

    message.body.sendTime = Int64(DateTime.now().millisecondsSinceEpoch);
    message.body.msgID = message.body.sendTime;
    message.body.contentType = type;
    message.body.msg = value;

    return message;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatScreenViewModel>.reactive(
        viewModelBuilder: () => ChatScreenViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => WillPopScope(
              onWillPop: () => _onWillPop(model),
              child: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  title: Text(
                    model.chatUser.nickname,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.info), onPressed: () {})
                  ],
                ),
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            //  点击顶部空白处触摸收起键盘
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: Scrollable(
                              physics: AlwaysScrollableScrollPhysics(),
                              controller: model.listScrollController,
                              axisDirection: AxisDirection.up,
                              viewportBuilder: (context, offset) {
                                return ExpandedViewport(
                                  offset: offset,
                                  axisDirection: AxisDirection.up,
                                  slivers: <Widget>[
                                    SliverExpanded(),
                                    SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        (c, i) {
                                          return model.msg == null
                                              ? Container(
                                                  child: Text('暂无消息'),
                                                )
                                              : ChatMessageItem(
                                                  message: model.msg[i],
                                                  onAudioTap: (String str) {},
                                                );
                                        },
                                        childCount: model.msg == null
                                            ? 1
                                            : model.msg.length,
                                      ),
                                    ),
                                    SliverToBoxAdapter(
                                      child: model.isShowLoading
                                          ? LoadingAnimation()
                                          : Container(),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                      ChatBottomInputWidget(
                        model: model,
                        shouldTriggerChange: model.changeNotifier.stream,
                        onSendCallBack: (value) {
                          model.onAddMessage(
                              buildMsgContent(value, model.currentUser.id,
                                  model.chatUser.id,
                                  type: ContentType.normalText),
                              true);

                          model.listScrollController.animateTo(0.00,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeOut);

                          Future.delayed(Duration(seconds: 1), () {});
                        },
                        onImageSelectBack: (path) {
                          print('选中图片上传完的网络路径:${path}');
                          model.onAddMessage(
                              buildMsgContent(path, model.currentUser.id,
                                  model.chatUser.id,
                                  type: ContentType.image),
                              true);

                          model.listScrollController.animateTo(0.00,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeOut);
                          Future.delayed(Duration(seconds: 1), () {});
                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
