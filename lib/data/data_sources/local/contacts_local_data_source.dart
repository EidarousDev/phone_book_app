import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/app_assets.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/storage_keys.dart';
import '../../models/contact_model.dart';

abstract class ContactsLocalDataSource {
  Future<List<ContactModel>> getCachedContacts();
  Future<List<ContactModel>> getSampleContacts();
  Future<Unit> cacheContacts(List<ContactModel> contacts);
}

class ContactsLocalDataSourceImpl implements ContactsLocalDataSource {
  final FlutterSecureStorage storage;

  ContactsLocalDataSourceImpl(this.storage);

  @override
  Future<List<ContactModel>> getSampleContacts() async {
    try {
      final String response =
          await rootBundle.loadString(AppAssets.sampleContacts);
      final contactsJson = await jsonDecode(response);
      return Future.value(_jsonToContactModels(contactsJson['contacts']));
    } catch (ex) {
      throw SampleFileException();
    }
  }

  @override
  Future<Unit> cacheContacts(List<ContactModel> contacts) async {
    List contactJson = contacts
        .map<Map<String, dynamic>>((contactModel) => contactModel.toJson())
        .toList();
    await storage.write(
        key: StorageKeys.cachedContacts, value: jsonEncode(contactJson));
    return Future.value(unit);
  }

  @override
  Future<List<ContactModel>> getCachedContacts() async {
    final contactsJson = await storage.read(key: StorageKeys.cachedContacts);
    if (contactsJson != null) {
      List decodedJsonData = jsonDecode(contactsJson);
      return Future.value(_jsonToContactModels(decodedJsonData));
    } else {
      return Future.value([]);
    }
  }

  List<ContactModel> _jsonToContactModels(List decodedJsonData) {
    List<ContactModel> contactModels = decodedJsonData
        .map<ContactModel>((json) => ContactModel.fromJson(json))
        .toList();
    return contactModels;
  }
}
