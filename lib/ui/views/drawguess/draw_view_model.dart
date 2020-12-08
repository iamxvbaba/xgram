
import 'package:stacked/stacked.dart';

import 'draw_entity.dart';

class DrawViewModel extends BaseViewModel {
  List<List<DrawEntity>> undoPoints = <List<DrawEntity>>[]; // 撤销的数据
  List<List<DrawEntity>> points = <List<DrawEntity>>[]; // 存储要画的数据
  List<DrawEntity> pointsList = <DrawEntity>[]; //预处理的数据，避免绘制时处理卡顿
  String pentColor = 'default'; //默认颜色
  double pentSize = 5; //默认字体大小


}