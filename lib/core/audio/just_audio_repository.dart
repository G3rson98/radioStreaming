import 'package:just_audio/just_audio.dart';

import 'audio_repository.dart';

class JustAudioRepository extends AudioRepository {
  final _player = AudioPlayer();

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> playFromUrl(String url) async {
    await _player.setUrl(url);
    _player.play();
  }

  @override
  Future<void> stop() async {
    await _player.stop();
  }

  @override
  Future<void> resume() async {
    await _player.play();
  }

}