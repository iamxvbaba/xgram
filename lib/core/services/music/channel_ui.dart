import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

import 'internal/meta.dart';
import 'player/music_player.dart';

import 'internal/serialization.dart';
import 'player/music_metadata.dart';
import 'player/play_mode.dart';
import 'player/play_queue.dart';
import 'player/playback_state.dart';
import 'player/transport_controls.dart';

/// MusicPlayer for UI interaction.
class MusicPlayer extends Player {
  final log = Logger('MusicPlayer');

  static const _uiChannel = MethodChannel('tech.soit.quiet/player.ui');

  static MusicPlayer _player;

  MusicPlayer._internal() : super() {
    _uiChannel.setMethodCallHandler(_handleRemoteCall);
    _uiChannel.invokeMethod('init');

    _queue.addListener(notifyListeners);
    _playMode.addListener(notifyListeners);
    _playbackState.addListener(notifyListeners);
    _metadata.addListener(notifyListeners);
  }

  factory MusicPlayer() {
    _player ??= MusicPlayer._internal();
    return _player;
  }

  void setPlayQueue(@nonNull PlayQueue queue) {
    _uiChannel.invokeMethod('setPlayQueue', queue.toMap());
  }

  Future<MusicMetadata> getNextMusic(@nonNull MusicMetadata anchor) async {
    assert(anchor != null);
    final map = await _uiChannel.invokeMethod('getNext', anchor.toMap());
    return createMusicMetadata(map);
  }

  Future<MusicMetadata> getPreviousMusic(
      @nonNull MusicMetadata metadata) async {
    assert(metadata != null);
    final map = await _uiChannel.invokeMethod('getPrevious', metadata.toMap());
    return createMusicMetadata(map);
  }

  @override
  ValueListenable<PlayQueue> get queueListenable => _queue;

  @override
  ValueListenable<PlaybackState> get playbackStateListenable => _playbackState;

  @override
  ValueListenable<PlayMode> get playModeListenable => _playMode;

  @override
  ValueListenable<MusicMetadata> get metadataListenable => _metadata;

  final ValueNotifier<PlayQueue> _queue = ValueNotifier(PlayQueue.empty());
  final ValueNotifier<PlaybackState> _playbackState =
      ValueNotifier(PlaybackState.none());
  final ValueNotifier<PlayMode> _playMode = ValueNotifier(PlayMode.sequence);
  final ValueNotifier<MusicMetadata> _metadata = ValueNotifier(null);

  Future<dynamic> _handleRemoteCall(MethodCall call) async {
    log.fine('on MethodCall: ${call.method} args = ${call.arguments}');
    switch (call.method) {
      case 'onPlaybackStateChanged':
        _playbackState.value = createPlaybackState(call.arguments);
        break;
      case 'onMetadataChanged':
        _metadata.value = createMusicMetadata(call.arguments);
        break;
      case 'onPlayQueueChanged':
        _queue.value = createPlayQueue(call.arguments);
        break;
      case 'onPlayModeChanged':
        _playMode.value = PlayMode(call.arguments as int);
        break;
      default:
        throw UnimplementedError();
    }
  }

  @nonNull
  TransportControls transportControls = TransportControls(_uiChannel);

  void insertToNext(@nonNull MusicMetadata metadata) {
    assert(metadata != null);
    _uiChannel.invokeMethod('insertToNext', metadata.toMap());
  }

  void playWithQueue(@nonNull PlayQueue playQueue, {MusicMetadata metadata}) {
    assert(playQueue != null);
    setPlayQueue(playQueue);
    if (playQueue.isEmpty) {
      return;
    }
    metadata = metadata ?? playQueue.queue.first;
    log.fine('playFromMediaId : ${metadata.mediaId}');
    transportControls.playFromMediaId(metadata.mediaId);
  }

  void removeMusicItem(MusicMetadata metadata) {}
}

class MusicPlayerValue {
  @nonNull
  final PlayQueue queue;

  @nonNull
  final PlayMode playMode;

  @nonNull
  final PlaybackState playbackState;

  @nullable
  final MusicMetadata metadata;

  MusicPlayerValue({
    @required this.queue,
    this.playMode,
    this.metadata,
    this.playbackState,
  }) : assert(queue != null);

  static final _empty = MusicPlayerValue(
    queue: PlayQueue.empty(),
    playMode: PlayMode.sequence,
    metadata: null,
    playbackState: PlaybackState.none(),
  );

  factory MusicPlayerValue.none() {
    return _empty;
  }

  MusicPlayerValue copy({
    PlayMode playMode,
    MusicMetadata metadata,
    PlayQueue queue,
    PlaybackState state,
  }) {
    return MusicPlayerValue(
      playMode: playMode ?? this.playMode,
      metadata: metadata ?? this.metadata,
      queue: queue ?? this.queue,
      playbackState: state ?? playbackState,
    );
  }
}
