import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/announcement.dart';
import '../repositories/announcement_repository.dart';

class GetAnnouncements{
  final AnnouncementRepository _repository;

  const GetAnnouncements(this._repository);

  Future<Either<Failure,List<Announcement>>> call() async {
    return await _repository.getAnnouncements();
  }

}