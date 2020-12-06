import 'dart:async';

import 'package:flutter/material.dart' hide Router;
import 'package:flutter/widgets.dart' hide Router;
import 'package:provider/provider.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/core/managers/core_manager.dart';
import 'package:provider_start/core/services/navigation/navigation_service.dart';
import 'package:provider_start/locator.dart';
import 'package:provider_start/logger.dart';
import 'package:provider_start/provider_setup.dart';
import 'package:provider_start/theme.dart';
import 'package:provider_start/ui/router.gr.dart';
import 'package:provider_start/local_setup.dart';
import 'package:provider_start/ui/views/startup/start_up_view.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLogger();
  await setupLocator();
  // 主题管理
  await ThemeManager.initialise();

  runZoned(
    () => runApp(MyApp()),
    onError: (e) {
      // Log to crashlytics
    },
  );
}

class MyApp extends StatelessWidget {
  final navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: CoreManager(
        child: ThemeBuilder(
          defaultThemeMode: ThemeMode.system,
          themes: getThemes(),
          statusBarColorBuilder: (theme) => theme.accentColor,
          builder: (ctx,regularTheme,darkTheme,themeMode) => MaterialApp(
            title: 'XGram',
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            localeResolutionCallback: loadSupportedLocals,
            onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
            navigatorKey: navigationService.navigatorKey,
            onGenerateRoute: Router().onGenerateRoute,
            home: StartUpView(),
          ),
        ),
      ),
    );
  }
}
