import 'package:provider_start/core/services/drawguess/draw_service.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/widgets.dart';


class DrawViewModel extends BaseViewModel {
  final _drawService = locator<DrawService>();
  List<List<DrawEntity>> get points => _drawService.points;
  List<DrawEntity> get pointsList => _drawService.pointsList;

  void setPentColor(String key) {
    _drawService.pentColor = key;
    notifyListeners();
  }
  String get pentColor => _drawService.pentColor;

  set pentSize(double size) {
    _drawService.pentSize = size;
    notifyListeners();
  }
  double get pentSize => _drawService.pentSize;

  Future<void> init() async {
    _drawService.setNotify(notifyListeners);
  }

  @override
  void dispose() {
    super.dispose();
    _drawService.setNotify(null);
  }

  //清除数据
  void clear() {
    _drawService.clear();
  }

  //绘制数据
  void sendDraw(Offset localPosition) {
    _drawService.sendDraw(localPosition);
  }

  //绘制Null数据隔断标识
  void sendDrawNull() {
    _drawService.sendDrawNull();
  }

  //撤销一条数据
  void undoDate() {
    _drawService.undoDate();
  }

  //反撤销一条数据
  void reverseUndoDate() {
    _drawService.reverseUndoDate();
  }
}