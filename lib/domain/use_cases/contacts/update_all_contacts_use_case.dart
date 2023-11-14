import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../entities/contact_entity.dart';
import '../../repositories/contacts_repo.dart';
import '../use_case.dart';

class UpdateAllContactsUseCase extends UseCase<Unit, UpdateContactsParams> {
  final ContactsRepo contactsRepo;

  UpdateAllContactsUseCase(this.contactsRepo);
  @override
  Future<Either<Failure, Unit>> call(UpdateContactsParams params) async {
    return await contactsRepo.updateAllContacts(params.contacts);
  }
}

class UpdateContactsParams{
  final List<Contact> contacts;

  UpdateContactsParams({required this.contacts});
}
