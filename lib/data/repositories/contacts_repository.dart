
import 'package:challenge_about_you/data/api/contacts_api.dart';
import 'package:challenge_about_you/data/models/contact.dart';
import 'package:challenge_about_you/infrastructure/extensions/string_extensions.dart';

abstract class ContactsRepository {
  Future<List<Contact>> fetchContacts();
  Future<List<Contact>> searchContacts(String query);
}

class ContactsRepositoryImpl implements ContactsRepository {

  final ContactsAPI _contactsAPI;
  List<Contact> _contactsCache = [];

  ContactsRepositoryImpl(this._contactsAPI);

  @override
  Future<List<Contact>> fetchContacts() async {
    try {
      List<String> contactsResponse = await _contactsAPI.getContacts();
      contactsResponse = contactsResponse.where((name) => !name.isBlank()).toList();
      _contactsCache = contactsResponse.map((name) => Contact(name: name)).toList();
      return _contactsCache;
    } catch (e) {
      throw Exception('Invalid Data');
    }
  }

  @override
  Future<List<Contact>> searchContacts(String query) async {
    if (_contactsCache.isEmpty) {
      await fetchContacts();
    }
    final queryLowercase = query.toLowerCase();
    return _contactsCache.where((contact) =>
        contact.name.toLowerCase().contains(queryLowercase)).toList();
  }

}