import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
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
          child: model.isBusy ? _LoadingAnimation() : _TestView(),
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

class _TestView extends ViewModelWidget<FMPlayingModel> {
  @override
  Widget build(BuildContext context, FMPlayingModel model) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PlayerBuilder.isPlaying(
            player: model.player,
            builder: (context, isPlaying) {
              return RaisedButton(
                child: Text(isPlaying ? 'Pause' : 'Play'),
                onPressed: model.playPause,
              );
            },
          ),
        ],
      ),
    );
  }
}
