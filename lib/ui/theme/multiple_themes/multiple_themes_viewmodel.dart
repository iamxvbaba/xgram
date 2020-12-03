import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ThemeModel {
  final int index;
  final String title;

  ThemeModel({this.index, this.title});
}

class MultipleThemesViewModel extends BaseViewModel {
  final ThemeService _themeService = locator<ThemeService>();

  List<ThemeModel> get themes => List<ThemeModel>.generate(
      2,
      (index) => ThemeModel(
            index: index,
            title: _getTitleForIndex(index),
          ));

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'light/Primary';
      case 1:
        return 'Dark';
    }
    return 'No theme for index';
  }

  void setTheme(ThemeModel themeData) =>
      _themeService.selectThemeAtIndex(themeData.index);
}
