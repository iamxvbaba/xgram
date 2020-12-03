import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  int _index = 2;
  int get index => _index;

  void changeTab(int index) {
    _index = index;
    notifyListeners();
  }
}
