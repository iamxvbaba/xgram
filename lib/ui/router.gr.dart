// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../core/models/post/post.dart';
import 'views/chat_screen/chat_screen_view.dart';
import 'views/chat_screen/select_image_demo.dart';
import 'views/login/login_view.dart';
import 'views/main/main_view.dart';
import 'views/startup/start_up_view.dart';
import 'widgets/stateful/post_details/post_details_view.dart';

class Routes {
  static const String mainView = '/main-view';
  static const String loginView = '/login-view';
  static const String startUpView = '/';
  static const String postDetailsView = '/post-details-view';
  static const String chatScreenPage = '/chat-screen-page';
  static const String selectImage = '/select-image';
  static const all = <String>{
    mainView,
    loginView,
    startUpView,
    postDetailsView,
    chatScreenPage,
    selectImage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.postDetailsView, page: PostDetailsView),
    RouteDef(Routes.chatScreenPage, page: ChatScreenPage),
    RouteDef(Routes.selectImage, page: SelectImage),
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
    ChatScreenPage: (data) {
      final args = data.getArgs<ChatScreenPageArguments>(
        orElse: () => ChatScreenPageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ChatScreenPage(
          key: args.key,
          userProfileId: args.userProfileId,
        ),
        settings: data,
      );
    },
    SelectImage: (data) {
      final args = data.getArgs<SelectImageArguments>(
        orElse: () => SelectImageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SelectImage(
          key: args.key,
          title: args.title,
        ),
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

/// ChatScreenPage arguments holder class
class ChatScreenPageArguments {
  final Key key;
  final String userProfileId;
  ChatScreenPageArguments({this.key, this.userProfileId});
}

/// SelectImage arguments holder class
class SelectImageArguments {
  final Key key;
  final String title;
  SelectImageArguments({this.key, this.title});
}
