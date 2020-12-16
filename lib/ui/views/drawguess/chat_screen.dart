import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/ui/views/chat_screen/icon_button.dart';
import 'package:provider_start/ui/views/drawguess/draw_view_model.dart';
import 'package:stacked/stacked.dart';

class chatScreen extends ViewModelWidget<DrawViewModel> {
  Widget _chatScreenBody(DrawViewModel model) {
    if (model.msg == null || model.msg.isEmpty) {
      return Center(
        child: Text(
          'No message found',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      );
    }
    return ListView.builder(
      controller: model.controller,
      shrinkWrap: true,
      reverse: true,
      physics: BouncingScrollPhysics(),
      itemCount: model.msg.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30)),
                color: Color(0xffBFABFF),
              ),
              child: Row(
                children: [
                  Text('昵称',
                      style: TextStyle(
                          fontSize: ScreenUtil().setWidth(25),
                          color: Color(0xff4396FF))),
                  SizedBox(width: ScreenUtil().setWidth(22)),
                  Text('just卧龙凤雏',
                      style: TextStyle(
                          fontSize: ScreenUtil().setWidth(25),
                          color: Colors.black)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    //设置对话框
    var alert = AlertDialog(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.3),
      title: Text('输入答案'),
      content: TextField(),
      actions: [
        FlatButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('确认'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    //显示对话框
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context, DrawViewModel model) {
    return Stack(
      children: <Widget>[
        _chatScreenBody(model),
        Positioned(
            bottom: ScreenUtil().setHeight(20),
            right: ScreenUtil().setWidth(20),
            child: RaisedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              color: Color(0xffD6D5B7),
              child: Text('输入答案'),
            )),
      ],
    );
  }
}
