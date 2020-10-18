import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_start/core/constant/app_icon.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/ui/views/contacts/contact_view.dart';
import 'package:provider_start/ui/views/drawer/sidebar_view.dart';
import 'package:provider_start/ui/views/main/main_view_model.dart';
import 'package:provider_start/ui/views/player/play_list_view.dart';
import 'package:provider_start/ui/views/settings/settings_view.dart';
import 'package:provider_start/ui/views/home/home_view.dart';
import 'package:provider_start/ui/widgets/animation/fade_in.dart';
import 'package:provider_start/ui/widgets/stateful/lazy_index_stack.dart';
import 'package:provider_start/ui/widgets/stateless/custom_widget.dart';
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
        material: (context, platform) {
          return MaterialScaffoldData(
            drawer: SidebarMenu(),
          );
        },
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
              showSelectedLabels: true, // 显示选中的标题
              showUnselectedLabels: false, // 隐藏未选中的标题
            );
          },
          currentIndex: model.index,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: CustomIcon(icon: AppIcon.home),
              activeIcon: CustomIcon(icon: AppIcon.homeFill),
              title: Text('home'),
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(icon: AppIcon.search),
              activeIcon: CustomIcon(icon: AppIcon.searchFill),
              title: Text('search'),
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(icon: AppIcon.notification),
              activeIcon: CustomIcon(icon: AppIcon.notificationFill),
              title: Text('notify'),
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: AppIcon.messageEmpty,
              ),
              activeIcon: CustomIcon(icon: AppIcon.messageFill),
              title: Text('message'),
            ),
          ],
          itemChanged: model.changeTab,
        ),
      ),
    );
  }
}
