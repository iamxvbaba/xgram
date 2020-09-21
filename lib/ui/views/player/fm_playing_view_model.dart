import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider_start/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class FMPlayingModel extends BaseViewModel {
  final _log = Logger('FMPlayingModel');
  final _player = locator<AssetsAudioPlayer>();

  AssetsAudioPlayer get player => _player;
  List<Audio> _songs = [];

  Future<void> init() async {
    setBusy(true);

    _songs = [
      Audio('assets/audios/country.mp3',
          metas: Metas(
            title: 'Country',
            artist: 'Florent Champigny',
            album: 'CountryAlbum',
            image: MetasImage.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600583471814&di=12cd03a1426560090e517fc282c384e7&imgtype=0&src=http%3A%2F%2Fpic.sc.chinaz.com%2F%2FFiles%2Fpic%2Fpic9%2F202009%2Fapic27848_s.jpg'), //can be MetasImage.network
          )),
      Audio('assets/audios/hiphop.mp3',
          metas: Metas(
            title: 'Country',
            artist: 'Florent Champigny',
            album: 'CountryAlbum',
            image: MetasImage.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600583471814&di=12cd03a1426560090e517fc282c384e7&imgtype=0&src=http%3A%2F%2Fpic.sc.chinaz.com%2F%2FFiles%2Fpic%2Fpic9%2F202009%2Fapic27848_s.jpg'), //can be MetasImage.network
          )),
    ];
    await _player.open(
      Playlist(
        audios: _songs,
      ),
      showNotification: true,
    );
    await _player.playlistPlayAtIndex(1);
    setBusy(false);
  }

  @override
  void dispose() {
    _player.stop();
    super.dispose();
  }

  void playPause() {
    _player.playOrPause();
  }

  void next() {
    _player.next();
  }

  void prev() {
    _player.previous();
  }
}

class AssetAudioPlayerIcons {
  AssetAudioPlayerIcons._();

  static const _kFontFam = 'AssetAudioPlayer';

  static const IconData play = IconData(0xe800, fontFamily: _kFontFam);
  static const IconData stop = IconData(0xe801, fontFamily: _kFontFam);
  static const IconData pause = IconData(0xe802, fontFamily: _kFontFam);
  static const IconData to_end = IconData(0xe803, fontFamily: _kFontFam);
  static const IconData to_start = IconData(0xe804, fontFamily: _kFontFam);
}
