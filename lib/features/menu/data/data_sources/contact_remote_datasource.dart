import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../models/contact_model.dart';

abstract class ContactRemoteDataSource{
  ///Calls the [apiUrl]/items/contact endpoint to get a list of contacts
  ///
  /// Throws a [ServerException] for all error codes
  /// Throws a [SocketException] if no response is sent
  Future<List<ContactModel>> getContacts();

}

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource{

  final Dio _dio;

  ContactRemoteDataSourceImpl(this._dio);

  @override
  Future<List<ContactModel>> getContacts() async {


    try{
      final response = await _dio.get("/items/contact");

      final List<ContactModel> contacts = [];

      for(var contact in response.data["data"]){
        contacts.add(ContactModel.fromJson(contact));
      }

      if(response.statusCode!=200){
        throw ServerException();
      }

      return contacts;
    }catch(e){
      rethrow ;
    }


  }


}