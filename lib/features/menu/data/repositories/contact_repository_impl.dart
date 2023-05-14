import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/contact.dart';
import '../../domain/repositories/contact_repository.dart';
import '../data_sources/contact_remote_datasource.dart';


class ContactRepositoryImpl implements ContactRepository{

  final ContactRemoteDataSource _remoteDataSource;

  ContactRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Contact>>> getContacts() async {
    try{
      final contacts = await _remoteDataSource.getContacts();
      return Right(contacts);
    }on ServerException {
      return Left(ServerFailure());
    }on SocketException{
      return Left(SocketFailure());
    }

  }


}