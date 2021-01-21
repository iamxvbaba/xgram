import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:stacked/stacked.dart';
import 'bubble.dart';
import 'chat_screen_view_model.dart';

class ChatMessageItem extends ViewModelWidget<ChatScreenViewModel> {
  Message message;
  bool isSelf;
  ValueSetter<String> onAudioTap;

  ChatMessageItem({Key key, this.message, this.onAudioTap});

  @override
  Widget build(BuildContext context, ChatScreenViewModel model) {
    isSelf = message.senderID == model.currentUser.id;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: isSelf
          ? getSentMessageLayout(context, model)
          : getReceivedMessageLayout(context, model),
    );
  }

  bool mIsPlayint = false;
  $fixnum.Int64 id = null;

  methodInChild(bool isPlay, $fixnum.Int64 uid) {
    mIsPlayint = isPlay;
    id = uid;
  }

  Widget getItemContent() {
    switch (message.body.contentType) {
      case ContentType.normalText:
        return Bubble(
          style: getItemBundleStyle(),
          // child:    Text(  '${(widget.mMessage as HrlTextMessage).text  }',  softWrap: true,style: TextStyle(fontSize: 14.0,color: Colors.black),),
          child: Text(
            '${message.body.msg}',
            softWrap: true,
            style: TextStyle(fontSize: 14.0, color: Colors.black),
          ),
        );
        break;
      case ContentType.image:
        return Container(
          child: CachedNetworkImage(
            imageUrl: message.body.msg,
            fit: BoxFit.cover,
            height: ScreenUtil().setHeight(250),
            placeholder: (context, url) => CircularProgressIndicator(),

          ),
        );
        break;
      case ContentType.voice:
        break;
    }
  }

  BubbleStyle getItemBundleStyle() {
    var styleSendText = BubbleStyle(
      nip: BubbleNip.rightText,
      color: Color(0xffCCEAFF),
      nipOffset: 5,
      nipWidth: 10,
      nipHeight: 10,
      padding: BubbleEdges.only(top: 8, bottom: 8, left: 8, right: 8),
    );

    var styleSendImg = BubbleStyle(
      nip: BubbleNip.noRight,
      color: Colors.transparent,
      nipOffset: 5,
      nipWidth: 10,
      nipHeight: 10,
      margin: BubbleEdges.only(left: 50.0),
    );

    var styleReceiveText = BubbleStyle(
      nip: BubbleNip.leftText,
      color: Colors.white,
      nipOffset: 5,
      nipWidth: 10,
      nipHeight: 10,
      margin: BubbleEdges.only(right: 50.0),
      padding: BubbleEdges.only(top: 8, bottom: 10, left: 10, right: 15),
    );

    var styleReceiveImg = BubbleStyle(
      nip: BubbleNip.noLeft,
      color: Colors.transparent,
      nipOffset: 5,
      nipWidth: 10,
      nipHeight: 10,
      margin: BubbleEdges.only(left: 50.0),
    );

    switch (message.body.contentType) {
      case ContentType.image:
        return isSelf ? styleSendImg : styleReceiveImg;
        break;
      case ContentType.normalText:
        return isSelf ? styleSendText : styleReceiveText;
        break;
      case ContentType.voice:
        return isSelf ? styleSendText : styleReceiveText;
        break;
    }
    return styleReceiveText;
  }

  Widget getSentMessageLayout(BuildContext context, ChatScreenViewModel model) {
    return Container(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              child: getItemContent(),
              margin: EdgeInsets.only(
                bottom: 5.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 5),
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  model.currentUser.avatar,
                ),
                radius: ScreenUtil().setWidth(40),
              ),
            ),
          ],
        ));
  }

  Widget getReceivedMessageLayout(
      BuildContext context, ChatScreenViewModel model) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
          //  mainAxisAlignment:MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 10),
              child: CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(model.chatUser.avatar),
                radius: ScreenUtil().setWidth(40),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              child: Bubble(
                style: getItemBundleStyle(),
                child: getItemContent(),
              ),
              margin: EdgeInsets.only(
                bottom: 5.0,
              ),
            ),
          ],
        ));
  }
}
