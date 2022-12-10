abstract class AudioRepository {

  Future<void> playFromUrl(int id,String url,String title,String pictureUrl);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();
  Stream<Duration> get positionStream;
  Duration? get audioDuration;
}