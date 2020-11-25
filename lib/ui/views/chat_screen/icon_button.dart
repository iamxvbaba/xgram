import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class OutlinedIconButton extends StatelessWidget {
  const OutlinedIconButton({Key key, @required this.icon, @required this.onTap})
      : super(key: key);
  final Icon icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(55),
        margin: EdgeInsets.all(ScreenUtil().setHeight(5)),
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(width: ScreenUtil().setWidth(2))),
        child: IconButton(
          splashColor: Colors.transparent,
          icon: icon,
          color: Colors.grey,
          iconSize: ScreenUtil().setWidth(50),
          padding: EdgeInsets.all(0),
          onPressed: onTap,
        ));
  }
}