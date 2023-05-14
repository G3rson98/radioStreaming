import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/announcement.dart';

abstract class AnnouncementRepository{
  Future<Either<Failure, List<Announcement>>> getAnnouncements();
}