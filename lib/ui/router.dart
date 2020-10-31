import 'package:auto_route/auto_route_annotations.dart';
import 'package:provider_start/ui/views/chat_screen/chat_screen_view.dart';
import 'package:provider_start/ui/views/login/login_view.dart';
import 'package:provider_start/ui/views/main/main_view.dart';
import 'package:provider_start/ui/views/player/play_list_view.dart';
import 'package:provider_start/ui/views/startup/start_up_view.dart';
import 'package:provider_start/ui/widgets/stateful/post_details/post_details_view.dart';

@AdaptiveAutoRouter(routes: [
  AdaptiveRoute(page: MainView),
  AdaptiveRoute(page: LoginView),
  AdaptiveRoute(page: StartUpView, initial: true),
  AdaptiveRoute(page: PostDetailsView),
  AdaptiveRoute(page: PlayListView),
  AdaptiveRoute(page: ChatScreenPage)
])
class $Router {}
