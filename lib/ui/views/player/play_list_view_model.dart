import 'package:logging/logging.dart';
import 'package:stacked/stacked.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class PlayListViewModel extends BaseViewModel {
  final _log = Logger('PlayListViewModel');

  List<Audio> _songs = [];

  Future<void> init() async {
    setBusy(true);

    _songs = [];

    setBusy(false);
  }
}
