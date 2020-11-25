import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider_start/ui/views/chat_screen/record_box_painter.dart';

class ChatRow extends StatelessWidget {
  const ChatRow(
      {Key key,
      @required this.content,
      @required this.avatar,
      @required this.self,
      this.voiceDuration})
      : super(key: key);
  final Widget content;
  final String avatar;
  final int voiceDuration;
  final bool self;

  @override
  Widget build(BuildContext context) {
    var rpx = MediaQuery.of(context).size.width / 750;
    var arrowWidth = 10 * rpx;
    var green = Color.fromARGB(255, 129, 233, 85);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 * rpx, vertical: 20 * rpx),
      child: Row(
        mainAxisAlignment:
            self ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          !self
              ? Container(
                  margin: EdgeInsets.only(right: 20 * rpx),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(avatar),
                  ))
              : SizedBox(),
          !self
              ? Container(
                  child: CustomPaint(
                  painter: ChatBoxPainter(
                      color: Colors.blue, width: arrowWidth, height: 15 * rpx),
                ))
              : SizedBox(),
          Expanded(
              child: Container(
                alignment: self ? Alignment.centerRight : Alignment.centerLeft,
                margin: EdgeInsets.only(
                  right: self ? 10 * rpx : 140 * rpx,
                  left: self ? 140 * rpx : 10 * rpx,
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: content,
                      // padding: EdgeInsets.symmetric(horizontal:15 * rpx,vertical: 10*rpx),
                      decoration: BoxDecoration(
                          color: self ? green : Colors.blue,
                          borderRadius: BorderRadius.circular(10 * rpx)),
                    )
                  ],
                ),
              )),
          self
              ? Container(
                  padding: EdgeInsets.only(top: 20 * rpx),
                  child: Transform.rotate(
                    angle: pi,
                    child: Container(
                        child: CustomPaint(
                      painter: ChatBoxPainter(
                          color: green, width: arrowWidth, height: 15 * rpx),
                    )),
                  ))
              : SizedBox(),
          self
              ? (Container(
                  margin: EdgeInsets.only(left: 20 * rpx),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(avatar),
                  )))
              : SizedBox(),
        ],
      ),
    );
  }
}
