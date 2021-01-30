import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mdi/mdi.dart';
import 'package:provider_start/ui/widgets/stateless/avatar.dart';

class HomeItem extends StatelessWidget {
  final String username;
  final String avatar;

  HomeItem({this.username, this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Avatar(
              avatar: avatar,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        username,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '20:00',
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  child: Text('这里填内容'),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.reply,
                        size: ScreenUtil().setWidth(50),
                      ),
                      onPressed: () {},
                    ),
                    textItem('1024'),
                    IconButton(
                        icon:
                            Icon(Icons.repeat, size: ScreenUtil().setWidth(50)),
                        onPressed: () {}),
                    textItem('1025'),
                    IconButton(
                      icon: Icon(Mdi.star, size: ScreenUtil().setWidth(50)),
                      onPressed: () {},
                    ),
                    textItem('1026'),
                    IconButton(
                      icon: Icon(Icons.more_horiz,
                          size: ScreenUtil().setWidth(50)),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

Text textItem(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: ScreenUtil().setWidth(24)),
  );
}
