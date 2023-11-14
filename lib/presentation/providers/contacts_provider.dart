import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/app_config.dart';
import '../../data/models/contact_model.dart';
import '../../domain/entities/contact_entity.dart';
import '../../domain/use_cases/contacts/get_contacts_use_case.dart';
import '../../domain/use_cases/contacts/update_all_contacts_use_case.dart';
import '../../domain/use_cases/use_case.dart';

class ContactsProvider extends ChangeNotifier {
  final GetContactsUseCase getContactsUseCase;
  final UpdateAllContactsUseCase updateAllContactsUseCase;

  ContactsProvider(
      {required this.getContactsUseCase,
      required this.updateAllContactsUseCase});

  // Private State
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  bool _gotAllContacts = false;

  // Getters
  UnmodifiableListView<Contact> get contacts => UnmodifiableListView(_contacts);
  UnmodifiableListView<Contact> get filteredContacts => UnmodifiableListView(_filteredContacts);

  // Setters
  set setFilteredContacts(List<Contact> value) {
    _filteredContacts = value;
  }

  // Methods
  Future<void> getContacts() async {
    if (_gotAllContacts) {
      return;
    }
    EasyLoading.show();
    final result = await getContactsUseCase(NoParams());
    result.fold((l) => debugPrint('Failed to retrieve Contacts'), (res) {
      // InitState
      _contacts = res;
      _gotAllContacts = true;
      notifyListeners();
    });
    EasyLoading.dismiss();
  }

  Future<void> addContact(
      {required String name,
      required String phone,
      required Function onFailure,
      required Function onSuccess}) async {
    EasyLoading.show();
    // get last contact id
    final int nextId = int.parse(_contacts[_contacts.length - 1].id) + 1;

    /// Since there is no server to upload the avatar, I'm setting a default avatar
    ContactModel newContact = ContactModel(
        id: '$nextId',
        name: name,
        phone: phone,
        avatar: AppConfig.defaultAvatar);
    final result = await updateAllContactsUseCase(
        UpdateContactsParams(contacts: [..._contacts, newContact]));
    result.fold((l) {
      debugPrint('Failed to add Contact');
      onFailure();
    }, (r) {
      _contacts.add(newContact);
      onSuccess();
      notifyListeners();
    });
    EasyLoading.dismiss();
  }

  Future<void> deleteContact(
      {required String id,
      required Function onSuccess,
      required Function onFailure}) async {
    final temp = _contacts;
    temp.removeWhere((c) => c.id == id);
    final result =
        await updateAllContactsUseCase(UpdateContactsParams(contacts: temp));
    result.fold((l) {
      debugPrint('Failed to remove Contact');
      onFailure();
    }, (r) {
      _contacts = temp;
      notifyListeners();
      onSuccess();
    });
  }

  Future<void> updateContact(
      {required Contact contact,
      required Function onSuccess,
      required Function onFailure}) async {
    final updatedContact = ContactModel(
        id: contact.id,
        name: contact.name,
        phone: contact.phone,
        avatar: contact.avatar);
    final temp = _contacts;
    temp[temp.indexWhere((c) => c.id == contact.id)] = updatedContact;
    final result =
        await updateAllContactsUseCase(UpdateContactsParams(contacts: temp));
    result.fold((l) {
      debugPrint('Failed to update Contact');
      onFailure();
    }, (r) {
      _contacts = temp;
      notifyListeners();
      onSuccess();
    });
  }

  void searchContact(String query) {
    _filteredContacts = _contacts.where(
            (c) => c.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void clearSearch(){
    _filteredContacts = [];
    notifyListeners();
  }
}
