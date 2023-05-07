import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../radio/domain/entities/audio_item.dart';
import '../repositories/history_repository.dart';

class GetPastEpisodes{
  final HistoryRepository _repository;

  const GetPastEpisodes(this._repository);

  Future<Either<Failure,List<AudioItem>>> call() async {
    return await _repository.getPastEpisodes();
  }

}