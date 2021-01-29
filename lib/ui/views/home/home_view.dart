import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/ui/views/home/home_view_model.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:stacked/stacked.dart';

double kHomeRefreshHeight = ScreenUtil().setHeight(300);

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bannerHeight = ScreenUtil().setHeight(280);
    return ViewModelBuilder<HomeViewModel>.reactive(
      // 使用PrimaryScrollController保留iOS点击状态栏回到顶部的功能
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
          body: model.isBusy
              ? _LoadingAnimation()
              : Container(
                  child: Text('index page'),
                )),
    );
  }
}

class _LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimation(),
    );
  }
}
