import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../radio/domain/entities/audio_item.dart';
import '../../domain/repositories/history_repository.dart';
import '../data_sources/history_remote_datasource.dart';

class HistoryRepositoryImpl implements HistoryRepository{

  final HistoryRemoteDataSource _historyRemoteDataSource;

  HistoryRepositoryImpl(this._historyRemoteDataSource);

  @override
  Future<Either<Failure, List<AudioItem>>> getPastEpisodes() async {
    try{
      final socialNetWorks = await _historyRemoteDataSource.getPastRadioEpisodes();
      return Right(socialNetWorks);
    }on ServerException {
      return Left(ServerFailure());
    }on SocketException{
      return Left(SocketFailure());
    }
  }


}