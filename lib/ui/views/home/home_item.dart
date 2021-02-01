import 'package:cached_network_image/cached_network_image.dart';
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
                      child: Text(username,
                          style: TextStyle(
                              fontSize: ScreenUtil().setWidth(30),
                              fontWeight: FontWeight.bold,)),
                    ),
                    Spacer(),
                    Text(
                      '20:00',
                    ),
                  ],
                ),
                Container(
                  child:
                      Text('先发一条动态先发一条动态先发一条动态先发一条动态先发一条动态先发一条动态先发一条动态先发一条动态~'),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: ScreenUtil().setHeight(280),
                    minHeight: ScreenUtil().setHeight(100),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3097946610,3683154407&fm=26&gp=0.jpg',
                    fit: BoxFit.cover,
                  ),
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
