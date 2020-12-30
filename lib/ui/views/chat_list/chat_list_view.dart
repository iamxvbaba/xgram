import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_start/core/proto/protobuf_gen/session.pb.dart';
import 'package:provider_start/core/utils/relative_date_format.dart';
import 'package:provider_start/ui/views/search/search_delegate.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

import 'chat_list_view_model.dart';

class SessionView extends StatefulWidget {
  @override
  _SessionViewState createState() => _SessionViewState();
}

class _SessionViewState extends State<SessionView> {
  @override
  Widget build(BuildContext context) {
    var bannerHeight = ScreenUtil().setHeight(50);

    return ViewModelBuilder<SessionViewModel>.reactive(
      viewModelBuilder: () => SessionViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('消息'), elevation: 0, actions: <Widget>[
          EmptyAnimatedSwitcher(
            //display: model.showTopBtn,
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showSearch(context: context, delegate: DefaultSearchDelegate());
              },
            ),
          ),
        ]),
        body: model.isBusy
            ? _LoadingAnimation()
            : MediaQuery.removePadding(
                context: context,
                removeTop: false,
                child: Builder(builder: (_) {
                  return RefreshConfiguration(
                    //headerTriggerDistance: ScreenUtil().setHeight(10),
                    child: SmartRefresher(
                        controller: model.refreshController,
                        header: _Refresh(),
                        enableTwoLevel: false,
                        enablePullDown: model.session.isNotEmpty,
                        onRefresh: () async {
                          await model.refresh();
                        },
                        onLoading: model.loadMore,
                        enablePullUp: model.session.isNotEmpty,
                        child: CustomScrollView(
                          controller: model.scrollController,
                          slivers: <Widget>[
                            SliverToBoxAdapter(
                              child: GestureDetector(
                                onTap: () {
                                  showSearch(
                                      context: context,
                                      delegate: DefaultSearchDelegate());
                                },
                                child: _Search(),
                              ),
                            ),
                            if (model.session?.isNotEmpty ?? false)
                              _SessionBody()
                          ],
                        )),
                  );
                })),
      ),
    );
  }
}

class _Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      height: ScreenUtil().setHeight(90),
      child: Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(30),
            right: ScreenUtil().setWidth(30),
            bottom: ScreenUtil().setWidth(20)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenUtil().setHeight(10)),
            color: Colors.white,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(Icons.search),
                Text(
                  '搜索',
                  style: TextStyle(color: Theme.of(context).iconTheme.color),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 首页列表的header
class _Refresh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var strings = RefreshLocalizations.of(context)?.currentLocalization ??
        EnRefreshString();
    return ClassicHeader(
      outerBuilder: (child) => _SecondFloorOuter(child),
      //twoLevelView: Container(),
      height: ScreenUtil().setHeight(70),
      refreshingIcon: _LoadingAnimation(),
      releaseText: strings.canRefreshText,
    );
  }
}

class _SecondFloorOuter extends StatelessWidget {
  final Widget child;

  _SecondFloorOuter(this.child);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: child);
  }
}

// 会话项
class _SessionItem extends ViewModelWidget<SessionViewModel> {
  final int index;
  const _SessionItem(this.index);
  @override
  Widget build(BuildContext context, SessionViewModel model) {
    return GestureDetector(
      onTap: () {
        model.pushChatScreen(model.session[index].user);
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setHeight(20),
          vertical: ScreenUtil().setWidth(15),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().setHeight(20)),
                child: CachedNetworkImage(
                  imageUrl: model.session[index].user.avatar,
                  width: ScreenUtil().setHeight(100),
                ),
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
                            model.session[index].user.nickname,
                            style: TextStyle(
                              fontSize: ScreenUtil().setHeight(26),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          model.session[index].badge > 0 // 未读标志
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
                        RelativeDateFormat.format(model
                            .session[index].msg.body.sendTime
                            .toInt()), //chat.time,
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
                        width: ScreenUtil().setWidth(350),
                        child: Text(
                          model.session[index].msg.body.msg, //chat.text,
                          style: TextStyle(
                            fontSize: ScreenUtil().setHeight(23),
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      model.session[index].badge == 0
                          ? Container()
                          : Container(
                        height: ScreenUtil().setHeight(30),
                        padding:
                        EdgeInsets.all(ScreenUtil().setHeight(4)),
                        decoration: BoxDecoration(
                          color: Color(0xFF9E9E9E), // 底色
                          borderRadius: BorderRadius.circular(
                              ScreenUtil().setHeight(15)), // 圆角度
                          //borderRadius: BorderRadius.vertical(top: Radius.elliptical(20, 50)), // 也可控件一边圆角大小
                        ),
                        child: Container(
                          width: ScreenUtil().setWidth(50),
                          child: Text(
                            model.session[index].badge < 99
                                ? '${model.session[index].badge}'
                                : '99+',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white, // 底色
                                fontSize: ScreenUtil().setWidth(20)),
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
}
class _SessionBody extends ViewModelWidget<SessionViewModel> {
  @override
  Widget build(BuildContext context, SessionViewModel model) {
    if (model.isBusy) {
      return SliverToBoxAdapter(
        child: _LoadingAnimation(),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _SessionItem(index);
        },
        childCount: model.session?.length ?? 0,
      ),
    );
  }
}

class EmptyAnimatedSwitcher extends StatelessWidget {
  final bool display;
  final Widget child;

  EmptyAnimatedSwitcher({this.display: true, this.child});

  @override
  Widget build(BuildContext context) {
    return ScaleAnimatedSwitcher(child: display ? child : SizedBox.shrink());
  }
}

class ScaleAnimatedSwitcher extends StatelessWidget {
  final Widget child;

  ScaleAnimatedSwitcher({this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: child,
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
