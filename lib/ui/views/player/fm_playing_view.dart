import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_start/ui/widgets/stateless/loading_animation.dart';
import 'package:stacked/stacked.dart';

import 'fm_playing_view_model.dart';

class FMPlayingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FMPlayingModel>.reactive(
      viewModelBuilder: () => FMPlayingModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => PlatformScaffold(
        body: Center(
          child: model.isBusy ? _LoadingAnimation() : Text('has data'),
        ),
      ),
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
