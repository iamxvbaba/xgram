// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/models/post/post.dart';
import 'views/contacts/contact_view.dart';
import 'views/login/login_view.dart';
import 'views/main/main_view.dart';
import 'views/player/play_list_view.dart';
import 'views/startup/start_up_view.dart';
import 'widgets/stateful/post_details/post_details_view.dart';

class Routes {
  static const String mainView = '/main-view';
  static const String loginView = '/login-view';
  static const String contactView = '/contact-view';
  static const String startUpView = '/';
  static const String postDetailsView = '/post-details-view';
  static const String playListView = '/play-list-view';
  static const all = <String>{
    mainView,
    loginView,
    contactView,
    startUpView,
    postDetailsView,
    playListView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.contactView, page: ContactView),
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.postDetailsView, page: PostDetailsView),
    RouteDef(Routes.playListView, page: PlayListView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    MainView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => MainView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    ContactView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ContactView(),
        settings: data,
      );
    },
    StartUpView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => StartUpView(),
        settings: data,
      );
    },
    PostDetailsView: (data) {
      final args = data.getArgs<PostDetailsViewArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PostDetailsView(
          key: args.key,
          post: args.post,
        ),
        settings: data,
      );
    },
    PlayListView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => PlayListView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// PostDetailsView arguments holder class
class PostDetailsViewArguments {
  final Key key;
  final Post post;
  PostDetailsViewArguments({this.key, @required this.post});
}
