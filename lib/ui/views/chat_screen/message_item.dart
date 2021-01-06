import 'package:flutter/material.dart';
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
          ? getSentMessageLayout(context)
          : getReceivedMessageLayout(context),
    );
  }

  bool mIsPlayint = false;
  $fixnum.Int64 id = null;

  methodInChild(bool isPlay, $fixnum.Int64 uid) {
    mIsPlayint = isPlay;
    id = uid;
  }

  Widget getmImageLayout(Message message) {
    Widget child;
    /*
    if (mMessgae.thumbPath != null && (!mMessgae.thumbPath.isEmpty)) {
      child =
          Image.file(File('${(widget.mMessage as HrlImageMessage).thumbPath}'));
    } else {
      child = Image.network(
        '${(widget.mMessage as HrlImageMessage).thumbUrl}',
        fit: BoxFit.fill,
      );
    }*/
    child = Text('getmImageLayout');
    return child;
  }

  Widget getItemContent() {
    switch (message.body.contentType) {
      case ContentType.image:
        return Container(
          /* width:mImgWidth,
          height: mImgHeight,*/
          constraints: BoxConstraints(
            maxWidth: 400,
            maxHeight: 150,
          ),
          child: getmImageLayout(message),
        );
        break;
      case ContentType.normalText:
        return Text(
          '${message.body.msg}',
          softWrap: true,
          style: TextStyle(fontSize: 14.0, color: Colors.black),
        );
        break;
      case ContentType.voice:
        var isStop = true;
        if (id == message.body.msgID) {
          if (!mIsPlayint) {
            isStop = true;
          } else {
            isStop = false;
          }
        } else {
          isStop = true;
        }
        //    print("是否停止:"+isStop.toString()+"widget.mUUid=:"+widget.mUUid );
        return GestureDetector(
          onTap: () {
            //  int result = await mAudioPlayer.play((widget.mMessage as HrlVoiceMessage).path, isLocal: true);
            onAudioTap('');
          },
          /*
          child: VoiceAnimationImage(
            isSelf ? mAudioAssetRightList : mAudioAssetLeftList,
            width: 100,
            height: 30,
            isStop: isStop,
            //&&(widget.mUUid==widget.mMessage.uuid)
          ),*/
        );
        break;
    }
  }

  /*playLocal() async {
    int result = await mAudioPlayer.play((widget.mMessage as HrlVoiceMessage).path, isLocal: true);
    //  int result = await mAudioPlayer.play("https://github.com/luanpotter/audioplayers");
    print("播放的路径："+"${(widget.mMessage as HrlVoiceMessage).path}"+"播放的结果:"+"${result}");
    mAudioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
         isPalying = false;
       });
    });
    setState(() {
      isPalying = true;
    });


  }*/

  BubbleStyle getItemBundleStyle() {
    var styleSendText = BubbleStyle(
      nip: BubbleNip.rightText,
      color: Color(0xffCCEAFF),
      nipOffset: 5,
      nipWidth: 10,
      nipHeight: 10,
      margin: BubbleEdges.only(left: 50.0),
      padding: BubbleEdges.only(top: 8, bottom: 10, left: 15, right: 10),
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

  Widget getSentMessageLayout(BuildContext context) {
    return Container(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Visibility(
              visible: message.body.contentType == ContentType.voice,
              child: Container(
                child: message.body.contentType == ContentType.voice
                    ? Text(
                        "12s'",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )
                    : Container(),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              child: Bubble(
                style: getItemBundleStyle(),
                // child:    Text(  '${(widget.mMessage as HrlTextMessage).text  }',  softWrap: true,style: TextStyle(fontSize: 14.0,color: Colors.black),),
                child: getItemContent(),
              ),
              margin: EdgeInsets.only(
                bottom: 5.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://c-ssl.duitang.com/uploads/item/201208/30/20120830173930_PBfJE.thumb.700_0.jpeg'),
                radius: 16.0,
              ),
            ),
          ],
        ));
  }

  Widget getReceivedMessageLayout(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
          //  mainAxisAlignment:MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://c-ssl.duitang.com/uploads/item/201208/30/20120830173930_PBfJE.thumb.700_0.jpeg'),
                radius: 16.0,
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
