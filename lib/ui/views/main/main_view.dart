import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/ui/views/contacts/contact_view.dart';
import 'package:provider_start/ui/views/main/main_view_model.dart';
import 'package:provider_start/ui/views/player/play_list_view.dart';
import 'package:provider_start/ui/views/settings/settings_view.dart';
import 'package:provider_start/ui/views/home/home_view.dart';
import 'package:provider_start/ui/widgets/animation/fade_in.dart';
import 'package:provider_start/ui/widgets/stateful/lazy_index_stack.dart';
import 'package:stacked/stacked.dart';

/// Main view container that handles rendering pages according to which bottom
/// navigation bar item is tapped
///   - can be replaced with a [TabView]
class MainView extends StatelessWidget {
  final _views = <Widget>[
    FadeIn(child: HomeView()),
    FadeIn(child: PlayListView()),
    FadeIn(child: ContactView()),
    FadeIn(child: SettingsView()),
  ];

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, model, child) => PlatformScaffold(
        body: LazyIndexedStack(
          reuse: true,
          index: model.index,
          itemCount: _views.length,
          itemBuilder: (_, index) => _views[index],
        ),
        bottomNavBar: PlatformNavBar(
          android: (context) {
            return MaterialNavBarData(
              type: BottomNavigationBarType.fixed, // 解决超过3个不显示颜色的问题
            );
          },
          currentIndex: model.index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: PlatformWidget(
                material: (_, __) => Icon(Icons.home),
                cupertino: (_, __) => Icon(CupertinoIcons.home),
              ),
              title: Text(local.homeViewTitle),
            ),
            BottomNavigationBarItem(
              icon: PlatformWidget(
                material: (_, __) => Icon(Icons.music_note),
                cupertino: (_, __) => Icon(CupertinoIcons.music_note),
              ),
              title: Text('music'),
            ),
            BottomNavigationBarItem(
              icon: PlatformWidget(
                material: (_, __) => Icon(Icons.contacts),
                cupertino: (_, __) => Icon(CupertinoIcons.person),
              ),
              title: Text('contact'),
            ),
            BottomNavigationBarItem(
              icon: PlatformWidget(
                material: (_, __) => Icon(Icons.settings),
                cupertino: (_, __) => Icon(CupertinoIcons.settings),
              ),
              title: Text(local.settingsViewTitle),
            ),
          ],
          itemChanged: model.changeTab,
        ),
      ),
    );
  }
}
