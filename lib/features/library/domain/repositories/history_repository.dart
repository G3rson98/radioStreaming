import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../radio/domain/entities/audio_item.dart';

abstract class HistoryRepository{
  Future<Either<Failure, List<AudioItem>>> getPastEpisodes();
}