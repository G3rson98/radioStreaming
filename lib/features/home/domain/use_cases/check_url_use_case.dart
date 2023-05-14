
import '../../../../core/network/url_repository.dart';

class CheckUrl{
  final UrlRepository _repository;

  const CheckUrl(this._repository);

  Future<bool> call(String url) async {
    return await _repository.canParseUrl(url);
  }

}