
import 'package:challenge_about_you/data/models/contact.dart';

abstract class ContactsRepository {
  Future<List<Contact>> fetchContacts();
  Future<List<Contact>> searchContacts(String query);
}

class ContactsRepositoryImpl implements ContactsRepository {

  static const Duration _futureDelay = Duration(milliseconds: 1000);

  List<Contact> _contactsCache = [];

  @override
  Future<List<Contact>> fetchContacts() async {
    await Future.delayed(_futureDelay);
    _contactsCache = _names.map((name) => Contact(name: name)).toList();
    return _contactsCache;
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

  final List<String> _names = [
    'Adi Shamir',
    'Alan Kay',
    'Andrew Yao',
    'Barbara Liskov',
    'Kristen Nygaard',
    'Leonard Adleman',
    'Leslie Lamport',
    'Ole-Johan Dahl',
    'Peter Naur',
    'Robert E. Kahn',
    'Ronald L. Rivest',
    'Vinton G. Cerf',
    'LALA',
    'Leslie Lamport',
    'Ole-Johan Dahl',
    'Peter Naur',
    'Robert E. Kahn',
    'Ronald L. Rivest',
    'Vinton G. Cerf',
  ];

}