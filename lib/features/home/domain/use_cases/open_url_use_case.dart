
import '../../../../core/network/url_repository.dart';

class OpenUrl{
  final UrlRepository _repository;

  const OpenUrl(this._repository);

  Future<void> call(String url) async {
    return await _repository.openUrl(url);
  }

}