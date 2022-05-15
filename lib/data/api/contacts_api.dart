
import 'dart:math';

abstract class ContactsAPI {
  Future<dynamic> getContacts();
}

class ContactsAPIImpl extends ContactsAPI {

  static const Duration _futureDelay = Duration(milliseconds: 1000);
  static const List<String> _names = [
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
    'UPPERCASE name',
    '   ',
    '.,/{}',
    'lowercase name',
    '@ / name',
    'X Æ A-12',
    '(#) special names',
    'Ashley not sorted',
  ];

  @override
  Future<dynamic> getContacts() async {
    // Simulate a network call by adding a delay
    await Future.delayed(_futureDelay);
    // Simulate a network error once in a while
    var showRandomError = Random().nextInt(10) == 1;
    if (showRandomError) {
      return 0;
    } else {
      return _names;
    }
  }

}