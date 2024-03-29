abstract class AudioRepository {

  Future<void> playFromUrl(int id,String url,String title,String pictureUrl);
  Future<Duration> pause();
  Future<void> resume();
  Future<void> stop();
  Future<void> seekAudioPosition(Duration position);
  Stream<Duration> get positionStream;
  Duration? get audioDuration;
}