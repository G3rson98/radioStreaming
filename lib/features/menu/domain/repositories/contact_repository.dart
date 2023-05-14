import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/contact.dart';

abstract class ContactRepository{
  Future<Either<Failure,List<Contact>>> getContacts();

}