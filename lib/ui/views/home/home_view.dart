import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/ui/views/home/home_item.dart';
import 'package:provider_start/ui/views/home/home_view_model.dart';
import 'package:provider_start/ui/views/search/search_delegate.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

double kHomeRefreshHeight = ScreenUtil().setHeight(300);

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      // 使用PrimaryScrollController保留iOS点击状态栏回到顶部的功能
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(title: Text('动态'), elevation: 0, actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showSearch(context: context, delegate: DefaultSearchDelegate());
              },
            ),
          ]),
          body: model.isBusy
              ? Center(
                  child: LoadingAnimation(),
                )
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
                      enablePullDown: model.users.isNotEmpty,
                      onRefresh: ()  {

                      },
                      onLoading: (){
                      },
                      enablePullUp: model.users.isNotEmpty,
                      child: CustomScrollView(
                        controller: model.scrollController,
                        slivers: <Widget>[
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (_, i) {
                                return HomeItem(avatar: model.users[i].avatar,
                                username: model.users[i].nickname,);
                              },
                              childCount: model.users?.length ?? 0,
                            ),
                          )
                        ],
                      )),
                );
              }))),
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
      refreshingIcon: Center(
        child: LoadingAnimation(),
      ),
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