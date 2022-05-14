

import 'package:challenge_about_you/data/models/contact.dart';

abstract class ContactsRepository {
  Future<List<Contact>> getContacts();
}

class ContactsRepositoryImpl implements ContactsRepository {

  final Duration _futureDelay = const Duration(milliseconds: 1000);
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
  ];

  @override
  Future<List<Contact>> getContacts() async {
    await Future.delayed(_futureDelay);
    return _names.map((name) => Contact(name: name)).toList();
  }

}