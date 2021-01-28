import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider_start/ui/views/startup/start_up_view_model.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,designSize: Size(750, 1334), allowFontScaling: false);
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: LoadingAnimation(),
        ),
      ),
    );
  }
}
