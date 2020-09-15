import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider_start/core/services/music/player/music_metadata.dart';
import 'package:provider_start/core/services/music/player/music_player_callback.dart';
import 'package:provider_start/core/services/music/player/play_mode.dart';
import 'package:provider_start/core/services/music/player/play_queue.dart';
import 'package:provider_start/core/services/music/player/playback_state.dart';

import '../channel_ui.dart';
import 'serialization.dart';

mixin ChannelPlayerCallbackAdapter on ValueNotifier<MusicPlayerValue>
    implements MusicPlayerCallback {
  bool handleRemoteCall(MethodCall call) {
    switch (call.method) {
      case 'onPlaybackStateChanged':
        onPlaybackStateChanged(createPlaybackState(call.arguments));
        break;
      case 'onMetadataChanged':
        onMetadataChange(createMusicMetadata(call.arguments));
        break;
      case 'onPlayQueueChanged':
        onPlayQueueChanged(createPlayQueue(call.arguments));
        break;
      case 'onPlayModeChanged':
        onPlayModeChanged(PlayMode(call.arguments as int));
        break;
      default:
        return false;
    }
    return true;
  }

  @override
  void onMetadataChange(MusicMetadata metadata) {
    value = value.copy(metadata: metadata);
  }

  @override
  void onPlayModeChanged(PlayMode playMode) {
    value = value.copy(playMode: playMode);
  }

  @override
  void onPlayQueueChanged(PlayQueue queue) {
    value = value.copy(queue: queue);
  }

  @override
  void onPlaybackStateChanged(PlaybackState state) {
    value = value.copy(state: state);
  }
}
