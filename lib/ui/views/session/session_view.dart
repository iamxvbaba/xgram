import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_start/ui/views/search/search_delegate.dart';
import 'package:provider_start/ui/views/session/conversation_view.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

import 'session_view_model.dart';

class SessionView extends StatefulWidget {
  @override
  _SessionViewState createState() => _SessionViewState();
}

class _SessionViewState extends State<SessionView> {
  @override
  Widget build(BuildContext context) {
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
      height: ScreenUtil().setHeight(50),
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
    return Container(
      child: Align(alignment: Alignment.center, child: child),
    );
  }
}
class _Item extends ViewModelWidget<SessionViewModel> {
  final int index;
  const _Item(this.index);
  @override
  Widget build(BuildContext context, SessionViewModel model) {
    return InkWell(
      onTap: () {
        model.pushChatScreen(model.session[index].user);
      },
      child: MyConversationView(model.session[index]),
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
          return _Item(index);
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
