import 'package:flutter/widgets.dart';

//基础实体
class DrawEntity {
  Offset offset;
  String color;
  double strokeWidth;
  DrawEntity(this.offset, {this.color = 'default', this.strokeWidth = 5.0});
}
