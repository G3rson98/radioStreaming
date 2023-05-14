import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../models/social_network_model.dart';

abstract class SocialNetworkRemoteDataSource{
  ///Calls the [apiUrl]/items/network endpoint to get a list of social networks
  ///
  /// Throws a [ServerException] for all error codes
  /// Throws a [SocketException] if no response is sent
  Future<List<SocialNetworkModel>> getSocialNetworks();

}

class SocialNetworkRemoteDataSourceImpl implements SocialNetworkRemoteDataSource{

  final Dio _dio;

  SocialNetworkRemoteDataSourceImpl(this._dio);

  @override
  Future<List<SocialNetworkModel>> getSocialNetworks() async {


    try{
      final response = await _dio.get("/items/network");

      final List<SocialNetworkModel> networks = [];

      for(var sn in response.data["data"]){
        networks.add(SocialNetworkModel.fromJson(sn));
      }

      if(response.statusCode!=200){
        throw ServerException();
      }

      return networks;
    }catch(e){
      rethrow ;
    }


  }


}