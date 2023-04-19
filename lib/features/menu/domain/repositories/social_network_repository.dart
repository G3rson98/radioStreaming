import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/social_network.dart';

abstract class SocialNetworkRepository{
  Future<Either<Failure,List<SocialNetwork>>> getSocialNetworks();

}