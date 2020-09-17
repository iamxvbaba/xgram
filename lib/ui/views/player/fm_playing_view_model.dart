import 'package:logging/logging.dart';
import 'package:provider_start/core/exceptions/repository_exception.dart';
import 'package:provider_start/core/models/netease/c_model.dart';
import 'package:provider_start/core/repositories/netease/netease.dart';
import 'package:provider_start/core/services/music/player/music_player.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';

class FMPlayingModel extends BaseViewModel {
  final _log = Logger('FMPlayingModel');
  final _musicRepository = locator<NeteaseRepository>();
  final _player = locator<Player>();

  List<Music> _musicList = [];
  List<Music> get musicList => _musicList;

  Future<void> init() async {
    setBusy(true);
    try {
      _musicList = await _musicRepository.getPersonalFmMusics();
      _log.fine('musicList:$_musicList');
    } on RepositoryException catch (e) {
      _log.shout(e.message);
    }
    setBusy(false);
  }
}
