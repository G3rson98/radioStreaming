import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'audio_repository.dart';

class JustAudioRepository extends AudioRepository {
  final _player = AudioPlayer();

  Duration? _duration;

  @override
  Future<Duration> pause() async {
    await _player.pause();
    return _player.position;
  }

  @override
  Future<void> playFromUrl(int id,String url,String title,String pictureUrl) async {
    final audioSource = AudioSource.uri(Uri.parse(url),
        tag: MediaItem(
            id: id.toString(),
            title: title,
          artUri: Uri.parse(pictureUrl)
        )
    );

    _duration = await _player.setAudioSource(audioSource);
    _player.play();

  }

  @override
  Future<void> seekAudioPosition(Duration position) async {
    await _player.seek(position);
  }

  @override
  Future<void> stop() async {
    await _player.stop();
  }

  @override
  Future<void> resume() async {
    await _player.play();
  }

  @override
  Stream<Duration> get positionStream => _player.positionStream;

  @override
  Duration? get audioDuration => _duration;



}