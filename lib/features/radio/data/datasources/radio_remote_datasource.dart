
import 'package:dio/dio.dart';

import '../../../../core/http/entities/http_response.dart';
import '../../domain/entities/audio_item.dart';
import '../models/radio_model.dart';

abstract class RadioRemoteDataSource{

  Future<HttpResponse<AudioItem>> getRadio();
}


class RadioRemoteDataSourceImpl implements RadioRemoteDataSource{

  final Dio _dio;

  RadioRemoteDataSourceImpl(this._dio);

  @override
  Future<HttpResponse<AudioItem>> getRadio() async {

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
    }on DioError{
      return HttpResponse(
          message: 'error'
      );
    }

  }

}