import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/ui/views/drawguess/draw_view_model.dart';
import 'package:provider_start/ui/views/drawguess/signature_painter.dart';
import 'package:stacked/stacked.dart';

import 'draw_color.dart';

//绘制布局页面
class DrawPage extends StatefulWidget {
  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DrawViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text('你画我猜'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.call_missed_outgoing),
                  onPressed: () {
                    //撤销一步
                    model.undoDate();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.call_missed),
                  onPressed: () {
                    //反撤销
                    model.reverseUndoDate();
                  },
                ),
              ],
            ),
            body: Container(
              color: Color(0x18262B33), // 整体背景色
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onPanUpdate: (DragUpdateDetails details) {
                            //按下
                            RenderBox referenceBox = context.findRenderObject();
                            var localPosition = referenceBox
                                .globalToLocal(details.localPosition);
                            model.sendDraw(localPosition);
                          },
                          //抬起来
                          onPanEnd: (DragEndDetails details) {
                            model.sendDrawNull();
                          },
                          child: Container(
                            color: Colors.white, // 画板所在颜色
                          ),
                        ),
                        CustomPaint(
                            painter: SignaturePainter(model.pointsList),
                            child: Container(
                              child: Text(model.points.length.toString()),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 80, bottom: 20),
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        buildInkWell(model, 2),
                        buildInkWell(model, 5),
                        buildInkWell(model, 8),
                        buildInkWell(model, 10),
                        buildInkWell(model, 15),
                        buildInkWell(model, 17),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 80, bottom: 20),
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: pintColor.keys.map((key) {
                        var value = pintColor[key];
                        return InkWell(
                          onTap: () {
                            model.setPentColor(key);
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            color: value,
                            child: model.pentColor == key
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: model.clear,
              tooltip: '',
              child: Icon(Icons.clear),
            )));
  }

  InkWell buildInkWell(DrawViewModel model, double size) {
    return InkWell(
      onTap: () {
        model.pentSize = size;
        //drawProvider.notifyListeners();
      },
      child: Container(
        width: 40,
        height: 40,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: pintColor[model.pentColor],
              //设置四周圆角 角度
              borderRadius: BorderRadius.all(Radius.circular(size / 2)),
              //设置四周边框
              border: model.pentSize == size
                  ? Border.all(width: 1, color: Colors.black)
                  : null,
            ),
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}
