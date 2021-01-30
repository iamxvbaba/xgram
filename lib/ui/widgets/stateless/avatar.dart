import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class Avatar extends StatelessWidget {
  final String avatar;
  Avatar({this.avatar});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
      child: CachedNetworkImage(
        imageUrl: avatar,
        width: ScreenUtil().setWidth(100),
        height: ScreenUtil().setWidth(100),
        fit: BoxFit.fill,
      ),
    );
  }
}
