import 'dart:async';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:provider_start/constant/constant.dart';

import 'image_animation.dart';

OverlayEntry mOverlayEntry;

String mButtonText = '按住发声';
String mCenterTipText = '';
final LocalFileSystem mLocalFileSystem = new LocalFileSystem();

double startY = 0.0;
double endY = 0.0;
double offsetY = 0.0;

int mSatrtRecordTime = 0;

/**
 * 最短录音时间
 **/
int MIN_INTERVAL_TIME = 1000;

String voiceIco = Constant.ASSETS_IMG + "ic_volume_1.png";

List<String> _assetList = new List();

bool showAnim = true;

typedef void OnAudioCallBack(File mAudioFile, int duration);

class RecordButton extends StatefulWidget {
  final OnAudioCallBack onAudioCallBack;

  const RecordButton({
    Key key,
    this.onAudioCallBack,
  }) : super(key: key);

  @override
  _RecordButtonState createState() => _RecordButtonState();
}

///显示录音悬浮布局
void buildOverLayView(BuildContext context) {
  if (mOverlayEntry == null) {
    mOverlayEntry =  OverlayEntry(builder: (content) {
      return Positioned(
        top: MediaQuery.of(context).size.height * 0.5 - 80,
        left: MediaQuery.of(context).size.width * 0.5 - 80,
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Opacity(
              opacity: 0.8,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Color(0xff77797A),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: showAnim
                            ? VoiceAnimationImage(
                                _assetList,
                                width: 100,
                                height: 100,
                                isStop: true,
                              )
                            : Image.asset(
                                voiceIco,
                                width: 100,
                                height: 100,
                              )),
                    Container(
//                      padding: EdgeInsets.only(right: 20, left: 20, top: 0),
                      child: Text(
                        mCenterTipText,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
    Overlay.of(context).insert(mOverlayEntry);
  }
}

Map<int, Image> imageCaches = new Map();

class _RecordButtonState extends State<RecordButton> {
//  Recording _recording = new Recording();
  void startRecord()  {
    print('开始录音');
  }

  void cancelRecord()  {
    print('取消录音删除文件成功!');
  }

  void completeRecord() async {
    print('录音完成');
  }

  bool flag = true; // member variable

  @override
  void initState() {

  }

  double startY = 0.0;
  double endY = 0.0;
  double offsetY = 0.0;

  @override
  Widget build(BuildContext context) {
    //buildGestureOverLayView(context);
    return Container(
      /* width: MediaQuery.of(context).size.width,*/
      //height: MediaQuery.of(context).size.height,
      //   color: Colors.deepOrange,
      child: GestureDetector(
        onVerticalDragStart: (details) {
          if (flag) {
            flag = false;
            Future.delayed(const Duration(milliseconds: 500), () {
              flag = true;
            });
            mCenterTipText = "手指上滑,取消发送";
            mButtonText = "松开发送";
            showAnim = true;
            buildOverLayView(context);
            setState(() {});
            startRecord();
            startY = details.globalPosition.dy;
            mSatrtRecordTime = new DateTime.now().millisecondsSinceEpoch;
          }
        },
        onVerticalDragEnd: (details) {
          setState(() {
            mButtonText = '按住录音';
          });
          if (offsetY >= 150) {
            print('执行取消录音:' + offsetY.toString());
            cancelRecord();
          } else {
            completeRecord();
          }
        },
        onVerticalDragUpdate: (details) {
          endY = details.globalPosition.dy;
          offsetY = startY - endY;
          print('偏移量是:' '(${offsetY})');
          if (offsetY >= 150) {
            //当手指向上滑，会cancel
            mCenterTipText = '松开手指,取消发送';
            voiceIco = Constant.ASSETS_IMG + 'ic_volume_cancel.png';
            showAnim = false;
            mOverlayEntry.markNeedsBuild();
            setState(() {
              mButtonText = '按住录音';
            });
            /* stopRecording();
                   recordDialog.dismiss();
                   File file = new File(mFile);
                   file.delete();*/
          } else {
            mCenterTipText = '手指上滑,取消发送';
            mButtonText = '松开发送';
            showAnim = true;
            mOverlayEntry.markNeedsBuild();
          }
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            //背景
            color: Colors.white,
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            //设置四周边框
            border: Border.all(width: 1, color: Color(0xffD2D2D2)),
          ),
          child: Center(
            child: Text(
              mButtonText,
            ),
          ),
        ),
      ),
    );
  }
}