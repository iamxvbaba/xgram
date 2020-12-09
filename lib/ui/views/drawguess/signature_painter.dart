import 'package:flutter/material.dart';
import 'package:provider_start/core/services/drawguess/draw_service.dart';
import 'package:provider_start/ui/views/drawguess/draw_color.dart';


//自定义 Canvas 画板
class SignaturePainter extends CustomPainter {
  List<DrawEntity> pointsList;
  Paint pt;

  SignaturePainter(this.pointsList) {
    pt = Paint() //设置笔的属性
      ..color = pintColor['default']
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.bevel;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < pointsList.length - 1; i++) {
      //画线
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        pt
          ..color = pintColor[pointsList[i].color]
          ..strokeWidth = pointsList[i].strokeWidth;

        canvas.drawLine(pointsList[i].offset, pointsList[i + 1].offset, pt);
      }
    }
  }

  //是否重绘
  @override
  bool shouldRepaint(SignaturePainter other) => other.pointsList != pointsList;
}


