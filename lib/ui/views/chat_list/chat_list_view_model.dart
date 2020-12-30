import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider_start/core/proto/protobuf_gen/abridged.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/session.pb.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/core/services/socket_state/chat_service.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:provider_start/ui/router.gr.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

class SessionViewModel extends BaseViewModel {
  final _chatStateService = locator<ChatStateService>();
  final _navigationService = locator<NavigationService>();
  final _log = Logger('ChatListViewModel');

  List<Session_content> _session;
  List<Session_content> get session {
    _session.sort((l,r)=>l.rank.compareTo(r.rank));
    return _session;
  }

  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  final ScrollController _scrollController = ScrollController();

  int _page=1;
  ScrollController get scrollController => _scrollController;
  RefreshController get refreshController => _refreshController;


  Future<void> init() async {
    setBusy(true);
    print('初始化 session 列表');
    await _chatStateService.initSession();
    _session = await _chatStateService.refreshSession();
    _chatStateService.setSessionNotify(notifyListeners);

    setBusy(false);
  }

  void scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 300), curve: Curves.easeOutCubic);
  }

  /// 下拉刷新
  /// true:  Error时,需要跳转页面
  /// false: Error时,不需要跳转页面,直接给出提示
  Future<List<Session_content>> refresh() async {
    List<Session_content> data = await _chatStateService.refreshSession();
    if (data != null && data.isNotEmpty) {
      _session.clear();
      _session.addAll(data);
      refreshController.refreshCompleted();
    } else {
      showToast('刷新没有session');
    }
    return data;
  }

  ///TODO: 上拉加载更多
  Future<List<Session_content>> loadMore() async {

  }

  @override
  void dispose() {
    super.dispose();
    _chatStateService.setSessionNotify(null);
    _scrollController.dispose();
    _refreshController.dispose();
  }

  void pushChatScreen(User chatUser) {
    //TODO: 调用接口角标设置为 0
    // 设置当前的聊天对象
    _chatStateService.setChatUser(chatUser);
    _navigationService.pushNamed(Routes.chatScreenPage);
  }
}
