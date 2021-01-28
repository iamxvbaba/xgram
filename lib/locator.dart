import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:provider_start/core/services/app_settings/app_settings_service.dart';
import 'package:provider_start/core/services/app_settings/app_settings_service_impl.dart';
import 'package:provider_start/core/services/drawguess/draw_service.dart';
import 'package:provider_start/core/services/event_hub/draw.dart';
import 'package:provider_start/core/services/socket_state/chat_service.dart';
import 'package:provider_start/core/services/socket_state/chat_service.dart';
import 'package:provider_start/core/services/http/http_service.dart';
import 'package:provider_start/core/services/http/http_service_impl.dart';
import 'package:provider_start/core/services/auth/auth_service.dart';
import 'package:provider_start/core/services/auth/auth_service_impl.dart';
import 'package:provider_start/core/services/connectivity/connectivity_service.dart';
import 'package:provider_start/core/services/connectivity/connectivity_service_impl.dart';
import 'package:provider_start/core/services/hardware_info/hardware_info_service.dart';
import 'package:provider_start/core/services/hardware_info/hardware_info_service_impl.dart';
import 'package:provider_start/core/services/key_storage/key_storage_service.dart';
import 'package:provider_start/core/services/key_storage/key_storage_service_impl.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/core/services/navigation/navigation_service_impl.dart';
import 'package:provider_start/core/services/snackbar/snack_bar_service.dart';
import 'package:provider_start/core/services/snackbar/snack_bar_service_impl.dart';
import 'package:provider_start/core/services/socket_state/socket.dart';
import 'package:provider_start/core/utils/file_helper.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:provider_start/core/services/event_hub/message.dart';

GetIt locator = GetIt.instance;

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.
Future<void> setupLocator() async {
  // Services
  locator.registerLazySingleton<NavigationService>(
    () => NavigationServiceImpl(),
  );
  locator.registerLazySingleton<HardwareInfoService>(
    () => HardwareInfoServiceImpl(),
  );
  locator.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(),
  );
  locator.registerLazySingleton<AppSettingsService>(
    () => AppSettingsServiceImpl(),
  );
  locator.registerLazySingleton<SnackBarService>(() => SnackBarServiceImpl());
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());


  await _setupSharedPreferences();

  // Utils
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());

  // External
  locator.registerLazySingleton<HiveInterface>(() => Hive);

  // 主题管理
  locator.registerSingleton(ThemeService.getInstance());
  // 画板消息通知
  locator.registerSingleton<DrawEvent>(DrawEvent(EventBus()));
  // 消息事件通知
  locator.registerSingleton<MessageEvent>(MessageEvent(EventBus()));
  // 全局socket
  locator.registerSingleton<SocketBloc>(SocketBloc());

  // 全局的聊天状态
  locator.registerSingleton<ChatStateService>(ChatStateService.instance);

  locator.registerSingleton<DrawService>(DrawService.instance);
}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance);
}
