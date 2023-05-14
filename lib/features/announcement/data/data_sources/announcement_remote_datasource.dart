import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../models/announcement_model.dart';


abstract class AnnouncementRemoteDataSource{
  ///Calls the [apiUrl]/items/announcement?filter[status][_eq]=0 endpoint to get a list of announcements
  ///with published status, retired status announcements will be ignored
  ///
  /// Throws a [ServerException] for all error codes
  /// Throws a [SocketException] if no response is sent
  Future<List<AnnouncementModel>> getAnnouncements();

}

class AnnouncementRemoteDataSourceImpl implements AnnouncementRemoteDataSource{

  final Dio _dio;

  AnnouncementRemoteDataSourceImpl(this._dio);

  @override
  Future<List<AnnouncementModel>> getAnnouncements() async {
    try{
      final response = await _dio.get("/items/announcement",queryParameters: {
        "filter[status][_eq]" : 0
      });

      final List<AnnouncementModel> announcements = [];

      for(var episode in response.data["data"]){
        announcements.add(AnnouncementModel.fromJson(episode));
      }

      if(response.statusCode!=200){
        throw ServerException();
      }

      return announcements;
    }catch(e){
      rethrow ;
    }



  }


}