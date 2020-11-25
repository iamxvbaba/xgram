import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/ui/views/chat_screen/record_row.dart';

class TextRecordRow extends StatelessWidget {
  const TextRecordRow({
    Key key,
    @required this.avatar,
    @required this.msg,
    @required this.self,
  }) : super(key: key);
  final String avatar;
  final String msg;
  final bool self;

  @override
  Widget build(BuildContext context) {
    return ChatRow(
      self: self,
      avatar: avatar,
      content: Column(children: [
        Container(
            padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20), vertical: ScreenUtil().setHeight(18)),
            child: Text(
              msg,
              style: TextStyle(
                  fontSize: ScreenUtil().setHeight(30),
                  letterSpacing: ScreenUtil().setWidth(2),
                  height: ScreenUtil().setHeight(2),
                  color: self?Colors.black:Colors.white),
            ))
      ]),
    );
  }
}
