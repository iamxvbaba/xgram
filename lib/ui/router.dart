import 'package:auto_route/auto_route_annotations.dart';
import 'package:provider_start/ui/views/chat_screen/chat_screen_view.dart';
import 'package:provider_start/ui/views/chat_screen/select_image_demo.dart';
import 'package:provider_start/ui/views/login/login_view.dart';
import 'package:provider_start/ui/views/main/main_view.dart';
import 'package:provider_start/ui/views/startup/start_up_view.dart';


@AdaptiveAutoRouter(routes: [
  AdaptiveRoute(page: MainView),
  AdaptiveRoute(page: LoginView),
  AdaptiveRoute(page: StartUpView, initial: true),
  AdaptiveRoute(page: ChatScreenPage),
  AdaptiveRoute(page: SelectImage)
])
class $Router {}
