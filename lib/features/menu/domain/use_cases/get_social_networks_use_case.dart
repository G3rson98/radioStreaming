import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/social_network.dart';
import '../repositories/social_network_repository.dart';

class GetSocialNetworks{
  final SocialNetworkRepository _repository;

  const GetSocialNetworks(this._repository);

  Future<Either<Failure,List<SocialNetwork>>> call() async {
    return await _repository.getSocialNetworks();
  }

}