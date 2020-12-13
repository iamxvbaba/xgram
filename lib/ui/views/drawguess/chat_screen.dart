import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
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
      itemBuilder: (context, index) => Row(
        children: [Text('sender:'), Text('msg')],
      ),
    );
  }

  Widget _bottomEntryField(DrawViewModel model) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Divider(
            thickness: 0,
            height: 1,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onSubmitted: (val) async {
                    submitMessage(model);
                  },
                  controller: model.messageController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10),
                        vertical: ScreenUtil().setHeight(28)),
                    border: InputBorder.none,
                    alignLabelWithHint: true,
                    hintText: '发送消息',
                    suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        color: Colors.grey,
                        onPressed: () => submitMessage(model)),
                    // fillColor: Colors.black12, filled: true
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<bool> _onWillPop(DrawViewModel model) async {}

  void submitMessage(DrawViewModel model) {}

  @override
  Widget build(BuildContext context, DrawViewModel model) {
    return WillPopScope(
      onWillPop: () => _onWillPop(model),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: _chatScreenBody(model),
            ),
          ),
          _bottomEntryField(model),
        ],
      ),
    );
  }
}
