import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/core/proto/protobuf_gen/message.pb.dart';
import 'package:provider_start/ui/views/drawguess/draw_view_model.dart';

class ChatScreen extends StatelessWidget {
  final DrawViewModel model;
  const ChatScreen(this.model);

  Widget _chatScreenBody(DrawViewModel model) {
    var msg = model.msg;
    if (msg == null || msg.isEmpty) {
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
      itemCount: msg.length,
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
                  Text(msg[index].eachInfo.sender.nickname,
                      style: TextStyle(
                          fontSize: ScreenUtil().setWidth(25),
                          color: Color(0xff4396FF))),
                  SizedBox(width: ScreenUtil().setWidth(22)),
                  Text(msg[index].body.msg,
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

  void _showAlertDialog(BuildContext context,DrawViewModel model) {
    //设置对话框
    var alert = AlertDialog(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.3),
      title: Text('输入答案'),
      content: TextField(
        controller: model.answerController,
      ),
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
            submitAnswer(model);
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

  void submitAnswer(DrawViewModel model) {
    if (model.answerController.text.isEmpty) {
      return;
    }
    Message message = Message.create();
    message.senderID = model.currentUser.id;

    message.eachInfo = MessageUser.create();
    message.eachInfo.sender = model.currentUser;

    message.body = MessageBody.create();
    message.body.contentType = ContentType.normalText;
    message.body.msg = model.answerController.text;
    model.sendMsg(message, true);
    model.answerController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _chatScreenBody(model),
        Positioned(
            bottom: ScreenUtil().setHeight(20),
            right: ScreenUtil().setWidth(20),
            child: RaisedButton(
              onPressed: () {
                _showAlertDialog(context,model);
              },
              color: Color(0xffD6D5B7),
              child: Text('输入答案'),
            )),
      ],
    );
  }
}
