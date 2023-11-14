import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/contact_entity.dart';
import '../../repositories/contacts_repo.dart';
import '../use_case.dart';

class GetContactsUseCase extends UseCase<List<Contact>, NoParams> {
  final ContactsRepo contactsRepo;

  GetContactsUseCase(this.contactsRepo);
  @override
  Future<Either<Failure, List<Contact>>> call(NoParams params) async {
    return await contactsRepo.getContacts();
  }
}
