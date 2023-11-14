import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/contact_entity.dart';

abstract class ContactsRepo{
  Future<Either<Failure, List<Contact>>> getContacts();
  Future<Either<Failure, Unit>> updateAllContacts(List<Contact> contacts);
}