import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/core/proto/protobuf_gen/session.pb.dart';
import 'package:provider_start/core/utils/relative_date_format.dart';

class MyConversationView extends StatefulWidget {
  final String title;
  final String subTitle;
  final String avatar;
  final String tag;
  MyConversationView({this.title,this.subTitle,this.avatar,this.tag});

  @override
  _MyConversationViewState createState() => _MyConversationViewState();
}

class _MyConversationViewState extends State<MyConversationView> {
  @override
  Widget build(BuildContext context) {
    var row = Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(10) ),
          child: Container(
            width: ScreenUtil().setWidth(490),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title ?? '',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 3.0),
                Text(
                  widget.subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color.fromRGBO(115, 115, 115, 1.0),
                      fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: ScreenUtil().setWidth(80),
          child: Column(
            children: [
              Text(
                widget.tag,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Icon(Icons.flag, color: Colors.transparent),
            ],
          ),
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
            child: CachedNetworkImage(
              imageUrl: widget.avatar,
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setWidth(100),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(20),
                top: ScreenUtil().setHeight(20),
                bottom: ScreenUtil().setHeight(15)),
            width: ScreenUtil().setWidth(600),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: Colors.grey, width: 0.2),
            )),
            child: row,
          )
        ],
      ),
    );
  }
}

class Space extends StatelessWidget {
  final double width;
  final double height;

  Space({this.width = 10.0, this.height = 10.0});

  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height);
  }
}

class SpecialTextStyle {
  TextRange textRange;
}
