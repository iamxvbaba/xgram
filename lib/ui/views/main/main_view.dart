import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/ui/theme/multiple_themes/multiple_themes_view.dart';
import 'package:provider_start/ui/views/chat_list/chat_list_view.dart';
import 'package:provider_start/ui/views/drawguess/draw_view.dart';
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
    FadeIn(child: ChatListView()), // SettingsView()
    FadeIn(child: HomeView()),
    FadeIn(child: DrawPage()),
    FadeIn(child: MultipleThemesView()),
    FadeIn(child: SettingsView()),
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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'test',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'notify',
            ),
          ],
          onTap: model.changeTab,
        ),
      ),
    );
  }
}
