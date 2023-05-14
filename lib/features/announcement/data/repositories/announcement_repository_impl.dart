import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/announcement.dart';
import '../../domain/repositories/announcement_repository.dart';
import '../data_sources/announcement_remote_datasource.dart';


class AnnouncementRepositoryImpl implements AnnouncementRepository{
  final AnnouncementRemoteDataSource _announcementRemoteDataSource;

  AnnouncementRepositoryImpl(this._announcementRemoteDataSource);


  @override
  Future<Either<Failure, List<Announcement>>> getAnnouncements() async {
    try{
      final announcements = await _announcementRemoteDataSource.getAnnouncements();
      return Right(announcements);
    }on ServerException {
      return Left(ServerFailure());
    }on SocketException{
      return Left(SocketFailure());
    }
  }

}