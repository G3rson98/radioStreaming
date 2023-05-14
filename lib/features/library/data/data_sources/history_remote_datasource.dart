import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../models/history_model.dart';


abstract class HistoryRemoteDataSource{
  ///Calls the [apiUrl]/items/episode endpoint to get a list of past radio episodes
  ///
  /// Throws a [ServerException] for all error codes
  /// Throws a [SocketException] if no response is sent
  Future<List<HistoryModel>> getPastRadioEpisodes();

}

class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource{

  final Dio _dio;

  HistoryRemoteDataSourceImpl(this._dio);

  @override
  Future<List<HistoryModel>> getPastRadioEpisodes() async {

    final response = await _dio.get("/items/episode");

    final List<HistoryModel> episodes = [];

    for(var episode in response.data["data"]){
      episodes.add(HistoryModel.fromJson(episode));
    }

    if(response.statusCode!=200){
      throw ServerException();
    }

    return episodes;

  }


}