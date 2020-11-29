import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_start/core/constant/app_icon.dart';
import 'package:provider_start/core/constant/theme.dart';
import 'package:provider_start/core/utils/utility.dart';
import 'package:provider_start/ui/widgets/stateless/custom_widget.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:provider_start/ui/widgets/stateless/ripple_button.dart';
import 'package:provider_start/ui/widgets/stateless/title_text.dart';
import 'package:stacked/stacked.dart';

import 'chat_list_view_model.dart';

class ChatListView extends StatefulWidget {
  @override
  _ChatListViewState createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatListViewModel>.reactive(
      viewModelBuilder: () => ChatListViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: customTitleText('历史会话'),
          cupertino: (_, __) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
        ),
        body: model.isBusy
            ? _LoadingAnimation()
            : model.contacts.users.isNotEmpty
                ? _ChatListBody()
                : _NoChatList(),
      ),
    );
  }
}

class _ChatListBody extends ViewModelWidget<ChatListViewModel> {
  Widget _item(BuildContext context, ChatListViewModel model, int index) {
    return GestureDetector(
      onTap: () {
        model.pushChatScreen(model.contacts.users[index]);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setHeight(20),
          vertical: ScreenUtil().setWidth(15),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: ScreenUtil().setHeight(56),
                backgroundImage:
                    NetworkImage(model.contacts.users[index].avatar),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65, //
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            model.contacts.users[index].nickname,
                            style: TextStyle(
                              fontSize: ScreenUtil().setHeight(26),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          true //chat.sender.isOnline
                              ? Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  width: ScreenUtil().setWidth(12),
                                  height: ScreenUtil().setHeight(12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              : Container(
                                  child: null,
                                ),
                        ],
                      ),
                      Text(
                        'now', //chat.time,
                        style: TextStyle(
                          fontSize: ScreenUtil().setHeight(25),
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '最后的信息', //chat.text,
                          style: TextStyle(
                            fontSize: ScreenUtil().setHeight(23),
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        height: ScreenUtil().setHeight(30),
                        padding: EdgeInsets.all(ScreenUtil().setHeight(4)),
                        decoration: BoxDecoration(
                          color: Color(0xFF9E9E9E), // 底色
                          borderRadius: BorderRadius.circular(ScreenUtil().setHeight(15)), // 圆角度
                          //borderRadius: BorderRadius.vertical(top: Radius.elliptical(20, 50)), // 也可控件一边圆角大小
                        ),
                        child: Container(
                          width: ScreenUtil().setWidth(50),
                          child: Text(
                            '100+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white, // 底色
                              fontSize: ScreenUtil().setWidth(20)
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, ChatListViewModel model) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: model.contacts.users.length,
      itemBuilder: (context, index) => _item(context, model, index),
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
        );
      },
    );
  }
}

class _NoChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('no chat list'),
    );
  }
}

class _LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimation(),
    );
  }
}
