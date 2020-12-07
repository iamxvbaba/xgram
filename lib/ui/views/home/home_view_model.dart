import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider_start/core/proto/protobuf_gen/home.pb.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';

class HomeViewModel extends BaseViewModel {
  final _log = Logger('HomeViewModel');
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final SocketBloc _socket = locator<SocketBloc>();
  final ScrollController _scrollController;
  final int _size = 20;
  int _page = 0;
  bool _showTopBtn = false;
  bool get showTopBtn => _showTopBtn;
  double _height;
  ScrollController get scrollController => _scrollController;
  RefreshController get refreshController => _refreshController;

  List<Article> topArticles = [];
  List<ABanner> banners = [];
  List<Article> list = [];

  HomeViewModel(this._scrollController,{double height = 200}){
    _height = height;
  }

  // ignore: always_declare_return_types
  scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 300), curve: Curves.easeOutCubic);
  }
  Future<void> init() async {
    setBusy(true);
    _scrollController.addListener(() {
      if (_scrollController.offset > _height && !_showTopBtn) {
        _showTopBtn = true;
        notifyListeners();
      } else if (_scrollController.offset < _height && _showTopBtn) {
        _showTopBtn = false;
        notifyListeners();
      }
    });
    await refresh();
    setBusy(false);
  }

  /// 下拉刷新
  /// true:  Error时,需要跳转页面
  /// false: Error时,不需要跳转页面,直接给出提示
  Future<HomeDataReply> refresh() async {
    HomeDataReply data = await _loadData(page: 0);
    if (data.articles == null || data.articles.isEmpty) {
      refreshController.refreshCompleted(resetFooterState: true);
      list.clear();
    } else {
      list.clear();
      list.addAll(data.articles);
      refreshController.refreshCompleted();
      // 小于分页的数量,禁止上拉加载更多
      if (data.articles.length < _size) {
        refreshController.loadNoData();
      } else {
        //防止上次上拉加载更多失败,需要重置状态
        refreshController.loadComplete();
      }
    }
    topArticles = data.topArticles;
    banners = data.banners;
    print('list:${list.length} topArticles:${topArticles.length} banners:${banners.length}');
    return data;
  }

  /// 上拉加载更多
  Future<HomeDataReply> loadMore() async {
    HomeDataReply data = await _loadData(page: ++_page);
    if (data.articles == null || data.articles.isEmpty) {
      _page--;
      refreshController.loadNoData();
    } else {
      list.addAll(data.articles);
      if (data.articles.length < _size) {
        refreshController.loadNoData();
      } else {
        refreshController.loadComplete();
      }
      notifyListeners();
    }
    return data;
  }

  Future<HomeDataReply> _loadData({int page}) async {
    var param = HomeDataArg.create();
    param.page = page;
    HomeDataReply reply = await _socket
        .send(OP.home, param, _convertHomeReply)
        .timeout(const Duration(seconds: 5))
        .catchError((e) {
      _log.warning('获取home data FAILED:$e');
    });
    return reply;
  }

  HomeDataReply _convertHomeReply(Response resp) {
    if (resp.code != 200) {
      _log.warning('获取home data失败:${resp.msg}');
      return null;
    }
    if (resp.data.isEmpty) {
      _log.warning('未有home data');
      return null;
    }
    return HomeDataReply.fromBuffer(resp.data);
  }
}
