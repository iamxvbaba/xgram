import 'package:flutter/foundation.dart';
import 'package:provider_start/core/services/music/channel_ui.dart';
import 'package:provider_start/core/services/music/player/music_metadata.dart';
import 'package:provider_start/core/services/music/player/play_mode.dart';
import 'package:provider_start/core/services/music/player/play_queue.dart';
import 'package:provider_start/core/services/music/player/playback_state.dart';

abstract class Player extends ChangeNotifier
    implements ValueListenable<MusicPlayerValue> {
  /// Current player state value.
  @override
  MusicPlayerValue get value => MusicPlayerValue(
        queue: queue,
        playMode: playMode,
        playbackState: playbackState,
        metadata: metadata,
      );

  /// See [metadataListenable].
  MusicMetadata get metadata => metadataListenable.value;

  /// See [queueListenable].
  PlayQueue get queue => queueListenable.value;

  /// See [playbackStateListenable].
  PlaybackState get playbackState => playbackStateListenable.value;

  /// See [playModeListenable]
  PlayMode get playMode => playModeListenable.value;

  /// Current playing music metadata.
  ValueListenable<MusicMetadata> get metadataListenable;

  /// Current playing music queue.
  ValueListenable<PlayQueue> get queueListenable;

  /// Current player's playback state.
  ValueListenable<PlaybackState> get playbackStateListenable;

  /// Current play mode.
  /// determine how to play [queueListenable].
  ValueListenable<PlayMode> get playModeListenable;
}
