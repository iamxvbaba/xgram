import 'package:logging/logging.dart';
import 'package:provider_start/core/repositories/netease/netease.dart';
import 'package:provider_start/core/services/music/player/music_player.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class FMPlayingModel extends BaseViewModel {
  final _log = Logger('FMPlayingModel');
  final _musicRepository = locator<NeteaseRepository>();
  final _player = locator<Player>();

  Future<void> init() async {
    setBusy(true);
    var musicList = await _musicRepository.getPersonalFmMusics();
    _log.fine('musicList:$musicList');
    setBusy(false);
  }
}
