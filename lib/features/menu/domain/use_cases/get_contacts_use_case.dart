import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/contact.dart';
import '../repositories/contact_repository.dart';

class GetContacts{
  final ContactRepository _repository;

  const GetContacts(this._repository);

  Future<Either<Failure,List<Contact>>> call() async {
    return await _repository.getContacts();
  }

}