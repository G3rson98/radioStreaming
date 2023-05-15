
import 'package:dio/dio.dart';

import '../../../../core/http/entities/http_response.dart';
import '../models/radio_model.dart';

abstract class RadioRemoteDataSource{
  ///Calls the [apiUrl]/items/radio endpoint to get the main radio data
  ///
  /// Throws a [ServerException] for all error codes
  /// Throws a [SocketException] if no response is sent
  Future<HttpResponse<RadioModel>> getRadio();
}


class RadioRemoteDataSourceImpl implements RadioRemoteDataSource{

  final Dio _dio;

  RadioRemoteDataSourceImpl(this._dio);

  @override
  Future<HttpResponse<RadioModel>> getRadio() async {

    try{
      final response = await _dio.get("/items/radio");

      if(response.statusCode!=200){
       return HttpResponse(
         message: 'error'
       );
      }

      return HttpResponse(
        ok: true,
        data: RadioModel.fromJson(response.data)
      );
    }on DioError catch (e){
      print(e.error);
      return HttpResponse(
          message: 'error'
      );
    }

  }

}