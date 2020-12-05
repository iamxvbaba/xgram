import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/ui/theme/multiple_themes/multiple_themes_view.dart';
import 'package:provider_start/ui/views/chat_list/chat_list_view.dart';
import 'package:provider_start/ui/views/main/main_view_model.dart';
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
    FadeIn(child: Container()),
    FadeIn(child: MultipleThemesView()),
    FadeIn(child: SettingsView()),
    FadeIn(child: ChatListView()), // SettingsView()
  ];

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, model, child) => Scaffold(
        body: LazyIndexedStack(
          reuse: true,
          index: model.index,
          itemCount: _views.length,
          itemBuilder: (_, index) => _views[index],
        ),
        bottomNavigationBar: ConvexAppBar(
          height: ScreenUtil().setHeight(80),
          initialActiveIndex: model.index, // 初始页面
          items: [
            TabItem(
              icon: Icons.home,
              title: 'home',
            ),
            TabItem(
              icon: Icons.search,
              title: 'search',
            ),
            TabItem(
              icon: Icons.add,
              title: 'test',
            ),
            TabItem(
              icon: Icons.notifications,
              title: 'notify',
            ),
            TabItem(
              icon: Icons.message,
              title: 'message',
            ),
          ],
          onTap: model.changeTab,
        ),
      ),
    );
  }
}
