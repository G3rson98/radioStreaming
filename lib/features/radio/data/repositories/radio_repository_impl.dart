import '../../../../core/http/entities/http_response.dart';
import '../../domain/entities/audio_item.dart';
import '../../domain/repositories/radio_repository.dart';
import '../datasources/radio_remote_datasource.dart';

class RadioRepositoryImpl implements RadioRepository{

  final RadioRemoteDataSource _radioRemoteDataSource;

  RadioRepositoryImpl(this._radioRemoteDataSource);

  @override
  Future<HttpResponse<AudioItem>> getRadio() async {
    return await _radioRemoteDataSource.getRadio();
  }

}