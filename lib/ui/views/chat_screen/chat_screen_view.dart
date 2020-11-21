import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_start/core/constant/theme.dart';
import 'package:provider_start/core/models/message/message.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/utils/utility.dart';
import 'package:provider_start/ui/views/chat_screen/chat_screen_view_model.dart';
import 'package:provider_start/ui/widgets/stateless/custom_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:fixnum/fixnum.dart';

class ChatScreenPage extends StatefulWidget {
  ChatScreenPage({Key key, this.userProfileId}) : super(key: key);

  final String userProfileId;

  @override
  _ChatScreenPageState createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  final messageController = TextEditingController();
  ScrollController _controller;
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _controller = ScrollController();
    super.initState();
  }

  Widget _chatScreenBody(ChatScreenViewModel model) {
    if (model.msg == null || model.msg.isEmpty) {
      return Center(
        child: Text(
          'No message found',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      );
    }
    return ListView.builder(
      controller: _controller,
      shrinkWrap: true,
      reverse: true,
      physics: BouncingScrollPhysics(),
      itemCount: model.msg.length,
      itemBuilder: (context, index) => _message(model.msg[index],
          model.chatUser, model.msg[index].senderID == model.currentUser.id),
    );
  }

  Widget _message(Message msg, User chatUser, bool self) {
    return Column(
      crossAxisAlignment:
          self ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisAlignment: self ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            self
                ? SizedBox()
                : CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: customAdvanceNetworkImage(chatUser.avatar),
                  ),
            Expanded(
              child: Container(
                alignment: self ? Alignment.centerRight : Alignment.centerLeft,
                margin: EdgeInsets.only(
                  right: self ? 10 : (fullWidth(context) / 4),
                  top: 20,
                  left: self ? (fullWidth(context) / 4) : 10,
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: getBorder(self),
                        color: self
                            ? TwitterColor.dodgetBlue
                            : TwitterColor.mystic,
                      ),
                      child: UrlText(
                        text: msg.body.msg,
                        style: TextStyle(
                          fontSize: 16,
                          color: self ? TwitterColor.white : Colors.black,
                        ),
                        urlStyle: TextStyle(
                          fontSize: 16,
                          color: self
                              ? TwitterColor.white
                              : TwitterColor.dodgetBlue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: InkWell(
                        borderRadius: getBorder(self),
                        onLongPress: () {
                          var text = ClipboardData(text: msg.body.msg);
                          Clipboard.setData(text);
                          _scaffoldKey.currentState.hideCurrentSnackBar();
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              backgroundColor: TwitterColor.white,
                              content: Text(
                                'Message copied',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        },
                        child: SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Text(
            getChatTime(
                DateTime.fromMillisecondsSinceEpoch(msg.body.sendTime.toInt())
                    .toLocal()
                    .toString()),
            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 12),
          ),
        )
      ],
    );
  }

  BorderRadius getBorder(bool myMessage) {
    return BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomRight: myMessage ? Radius.circular(0) : Radius.circular(20),
      bottomLeft: myMessage ? Radius.circular(20) : Radius.circular(0),
    );
  }

  Widget _bottomEntryField(ChatScreenViewModel model) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Divider(
            thickness: 0,
            height: 1,
          ),
          TextField(
            onSubmitted: (val) async {
              submitMessage(model);
            },
            controller: messageController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 13),
              alignLabelWithHint: true,
              hintText: 'Start with a message...',
              suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => submitMessage(model)),
              // fillColor: Colors.black12, filled: true
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> _onWillPop(ChatScreenViewModel model) async {
    // final chatState = Provider.of<ChatState>(context,listen: false);
    model.setIsChatScreenOpen = false;
    return true;
  }

  void submitMessage(ChatScreenViewModel model) {
    if (messageController.text.isEmpty) {
      return;
    }
    Message message = Message.create();
    message.senderID = model.currentUser.id;
    message.userID = model.chatUser.id;
    message.body = MessageBody.create();

    message.body.sendTime = Int64(DateTime.now().millisecondsSinceEpoch);
    message.body.msg = messageController.text;
    model.onAddMessage(message, true);
    Future.delayed(Duration(milliseconds: 50)).then((_) {
      messageController.clear();
    });
    try {
      // final state = Provider.of<ChatState>(context,listen: false);
      if (model.msg != null && model.msg.length > 1 && _controller.offset > 0) {
        _controller.animateTo(
          0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      }
    } catch (e) {
      print('[Error] $e');
    }
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
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UrlText(
                        text: model.chatUser.nickname,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        model.chatUser.nickname,
                        style:
                            TextStyle(color: AppColor.darkGrey, fontSize: 15),
                      )
                    ],
                  ),
                  iconTheme: IconThemeData(color: Colors.blue),
                  backgroundColor: Colors.white,
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.info, color: AppColor.primary),
                        onPressed: () {})
                  ],
                ),
                body: SafeArea(
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 50),
                          child: _chatScreenBody(model),
                        ),
                      ),
                      _bottomEntryField(model)
                    ],
                  ),
                ),
              ),
            ));
  }
}
