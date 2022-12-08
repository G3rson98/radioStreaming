abstract class AudioRepository {

  Future<void> playFromUrl(String url);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();
}