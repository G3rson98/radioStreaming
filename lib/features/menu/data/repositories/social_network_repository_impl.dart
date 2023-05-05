import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/social_network.dart';
import '../../domain/repositories/social_network_repository.dart';
import '../data_sources/social_network_remote_datasource.dart';

class SocialNetworkRepositoryImpl implements SocialNetworkRepository{

  final SocialNetworkRemoteDataSource _remoteDataSource;

  SocialNetworkRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<SocialNetwork>>> getSocialNetworks() async {
      try{
        final socialNetWorks = await _remoteDataSource.getSocialNetworks();
        return Right(socialNetWorks);
      }on ServerException {
        return Left(ServerFailure());
      } on SocketException{
        return Left(SocketFailure());
      }

  }


}