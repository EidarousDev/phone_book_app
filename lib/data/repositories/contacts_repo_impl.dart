import 'package:dartz/dartz.dart';

import 'package:phone_book_app/core/error/failures.dart';

import 'package:phone_book_app/domain/entities/contact_entity.dart';

import '../../domain/repositories/contacts_repo.dart';
import '../data_sources/local/contacts_local_data_source.dart';
import '../models/contact_model.dart';

class ContactsRepoImpl implements ContactsRepo{
  final ContactsLocalDataSource localDataSource;

  ContactsRepoImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Contact>>> getContacts() async {
    try {
      final cached = await localDataSource.getCachedContacts();
      if (cached.isEmpty) {
        // If the cache is empty, show the sample contacts
        return Right(await localDataSource.getSampleContacts());
      }
      // Else, show the cached contacts
      return Right(cached);
    } catch(ex){
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateAllContacts(List<Contact> contacts) async {
    try {
      List<ContactModel> contactsModels = contacts.map((c) => ContactModel(
          id: c.id, name: c.name, phone: c.phone, avatar: c.avatar))
          .toList();
      await localDataSource.cacheContacts(contactsModels);
      return const Right(unit);
    } catch(ex){
      return Left(UpdateCacheFailure());
    }
  }

}