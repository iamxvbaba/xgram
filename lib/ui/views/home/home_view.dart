import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider_start/ui/views/home/article_list_Item.dart';
import 'package:provider_start/ui/views/home/home_view_model.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

double kHomeRefreshHeight = ScreenUtil().setHeight(300);

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bannerHeight = ScreenUtil().setHeight(280);
    return ViewModelBuilder<HomeViewModel>.reactive(
      // 使用PrimaryScrollController保留iOS点击状态栏回到顶部的功能
      viewModelBuilder: () => HomeViewModel(PrimaryScrollController.of(context),
          height: bannerHeight - kToolbarHeight),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? _LoadingAnimation()
            : MediaQuery.removePadding(
                context: context,
                removeTop: false,
                child: Builder(builder: (_) {
                  return RefreshConfiguration(
                    // 下拉触发二楼距离
                    twiceTriggerDistance:
                        kHomeRefreshHeight - ScreenUtil().setHeight(15),
                    //最大下拉距离,android默认为0,这里为了触发二楼
                    maxOverScrollExtent: kHomeRefreshHeight,
                    headerTriggerDistance:
                        80 + MediaQuery.of(context).padding.top / 3,
                    child: SmartRefresher(
                        controller: model.refreshController,
                        header: HomeRefreshHeader(),
                        enableTwoLevel: model.list.isNotEmpty,
                        onTwoLevel: () async {
                          // push page
                          await model.refreshController.twoLevelComplete();
                        },
                        //footer: RefresherFooter(),
                        enablePullDown: model.list.isNotEmpty,
                        onRefresh: () async {
                          await model.refresh();
                        },
                        onLoading: model.loadMore,
                        enablePullUp: model.list.isNotEmpty,
                        child: CustomScrollView(
                          controller: model.scrollController,
                          slivers: <Widget>[
                            SliverToBoxAdapter(),
                            SliverAppBar(
                              // 加载中并且亮色模式下,状态栏文字为黑色
                              brightness: Theme.of(context).brightness ==
                                          Brightness.light &&
                                      model.isBusy
                                  ? Brightness.light
                                  : Brightness.dark,
                              actions: <Widget>[
                                EmptyAnimatedSwitcher(
                                  display: model.showTopBtn,
                                  child: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {
                                      showSearch(
                                        context: context,
                                        /*delegate: DefaultSearchDelegate()*/
                                      );
                                    },
                                  ),
                                ),
                              ],
                              flexibleSpace: FlexibleSpaceBar(
                                background: BannerWidget(),
                                centerTitle: true,
                                title: GestureDetector(
                                  onDoubleTap: model.scrollToTop,
                                  child: EmptyAnimatedSwitcher(
                                    display: model.showTopBtn,
                                    child: Text('XGram'),
                                  ),
                                ),
                              ),
                              expandedHeight: bannerHeight,
                              pinned: true,
                            ),
                            /*if (homeModel.isEmpty)
                              SliverToBoxAdapter(
                                  child: Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: ViewStateEmptyWidget(
                                    onPressed: homeModel.initData),
                              )),*/
                            if (model.topArticles?.isNotEmpty ?? false)
                              HomeTopArticleList(),
                            HomeArticleList(),
                          ],
                        )),
                  );
                })),
      ),
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

/// 首页列表的header
class HomeRefreshHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var strings = RefreshLocalizations.of(context)?.currentLocalization ??
        EnRefreshString();
    return ClassicHeader(
      canTwoLevelText: 'release to enter second floor',
      textStyle: TextStyle(color: Colors.white),
      outerBuilder: (child) => HomeSecondFloorOuter(child),
      twoLevelView: Container(),
      height: 70 + MediaQuery.of(context).padding.top / 3,
      refreshingIcon: CupertinoActivityIndicator(),
      releaseText: strings.canRefreshText,
    );
  }
}

class HomeSecondFloorOuter extends StatelessWidget {
  final Widget child;

  HomeSecondFloorOuter(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHomeRefreshHeight +
          MediaQuery.of(context).padding.top +
          ScreenUtil().setHeight(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_second_floor_builder.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text('跌跌撞撞中,依旧热爱这个世界.',
                style: Theme.of(context).textTheme.overline.copyWith(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
          ),
          Align(alignment: Alignment(0, 0.85), child: child),
        ],
      ),
      alignment: Alignment.bottomCenter,
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

class BannerWidget extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: model.isBusy
          ? CupertinoActivityIndicator()
          : Swiper(
              loop: true,
              autoplay: true,
              autoplayDelay: 5000,
              pagination: SwiperPagination(),
              itemCount: model.banners.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                    onTap: () {},
                    child: BannerImage(model.banners[index].imagePath));
              },
            ),
    );
  }
}

class BannerImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  BannerImage(this.url, {this.fit: BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url.startsWith('http')
            ? url
            : 'http://www.meetingplus.cn/uimg/$url',
        placeholder: (context, url) =>
            Center(child: CupertinoActivityIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: fit);
  }
}

class HomeTopArticleList extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ArticleItemWidget(
            model.topArticles[index],
            index: index,
            top: true,
          );
        },
        childCount: model.topArticles?.length ?? 0,
      ),
    );
  }
}

class HomeArticleList extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    if (model.isBusy) {
      return SliverToBoxAdapter(
        child: _LoadingAnimation(),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ArticleItemWidget(
            model.list[index],
            index: index,
          );
        },
        childCount: model.list?.length ?? 0,
      ),
    );
  }
}
