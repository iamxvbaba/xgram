import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_start/core/constant/theme.dart';
import 'package:provider_start/core/models/message/message.dart';
import 'package:provider_start/core/utils/utility.dart';
import 'package:provider_start/ui/views/chat_screen/chat_screen_view_model.dart';
import 'package:provider_start/ui/widgets/stateless/custom_widget.dart';
import 'package:stacked/stacked.dart';

class ChatScreenPage extends StatefulWidget {
  ChatScreenPage({Key key, this.userProfileId}) : super(key: key);

  final String userProfileId;

  @override
  _ChatScreenPageState createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  final messageController = TextEditingController();
  String senderId;
  String userImage;
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
    senderId = '1';
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
      itemBuilder: (context, index) => chatMessage(model.msg[index]),
    );
  }

  Widget chatMessage(ChatMessage message) {
    if (senderId == null) {
      return Container();
    }
    if (message.senderId == senderId) {
      return _message(message, true);
    } else {
      return _message(message, false);
    }
  }

  Widget _message(ChatMessage chat, bool myMessage) {
    return Column(
      crossAxisAlignment:
          myMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisAlignment:
          myMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 15,
            ),
            myMessage
                ? SizedBox()
                : CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: customAdvanceNetworkImage(userImage),
                  ),
            Expanded(
              child: Container(
                alignment:
                    myMessage ? Alignment.centerRight : Alignment.centerLeft,
                margin: EdgeInsets.only(
                  right: myMessage ? 10 : (fullWidth(context) / 4),
                  top: 20,
                  left: myMessage ? (fullWidth(context) / 4) : 10,
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: getBorder(myMessage),
                        color: myMessage
                            ? TwitterColor.dodgetBlue
                            : TwitterColor.mystic,
                      ),
                      child: UrlText(
                        text: chat.message,
                        style: TextStyle(
                          fontSize: 16,
                          color: myMessage ? TwitterColor.white : Colors.black,
                        ),
                        urlStyle: TextStyle(
                          fontSize: 16,
                          color: myMessage
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
                        borderRadius: getBorder(myMessage),
                        onLongPress: () {
                          var text = ClipboardData(text: chat.message);
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
            getChatTime(chat.createdAt),
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
    model.disposex();
    return true;
  }

  void submitMessage(ChatScreenViewModel model) {
    ChatMessage message;
    message = ChatMessage(
        message: messageController.text,
        createdAt: DateTime.now().toUtc().toString(),
        senderId: model.currentUser.id.toString(),
        receiverId: model.currentUser.id.toString(),
        seen: false,
        timeStamp: DateTime.now().toUtc().millisecondsSinceEpoch.toString(),
        senderName: model.currentUser.name);
    if (messageController.text == null || messageController.text.isEmpty) {
      return;
    }
    var myUser = model.currentUser;
    var secondUser = model.chatUser;
    model.onMessageSubmitted(message, myUser: myUser, secondUser: secondUser);
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
        builder: (context, model, child) => WillPopScope(
              onWillPop: () => _onWillPop(model),
              child: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UrlText(
                        text: model.chatUser.name,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        model.chatUser.name,
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
