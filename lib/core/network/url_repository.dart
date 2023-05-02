

abstract class UrlRepository{
  Future<bool> canParseUrl(String url);
  Future<void> openUrl(String url);
}