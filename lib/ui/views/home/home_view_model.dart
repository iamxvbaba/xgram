import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider_start/core/proto/protobuf_gen/user.pb.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/locator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _log = Logger('HomeViewModel');
  final SocketBloc _socket = locator<SocketBloc>();

  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;
  RefreshController get refreshController => _refreshController;

  List<User> users = [];

  Future<void> init() async {
    setBusy(true);
    for (var i = 0; i < 10; i++) {
      User user = User.create();
      user.avatar = 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=717634992,2776618738&fm=26&gp=0.jpg';
      user.nickname = 'moments';
      users.add(user);
    }
    setBusy(false);
  }
}
