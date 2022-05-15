
import 'package:challenge_about_you/data/api/contacts_api.dart';
import 'package:challenge_about_you/data/models/contact.dart';
import 'package:challenge_about_you/data/repositories/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ContactsRepository? contactsRepository;
  const List<String> contacts = ['Andy', 'Mary', 'Rhonda'];

  setUp(() {
    var apiStub = ContactsAPIStub(contacts);
    contactsRepository = ContactsRepositoryImpl(apiStub);
  });

  tearDown(() {
    contactsRepository = null;
  });

  test('fetchContacts to return a list of expected Contacts', () async {
    // Arrange
    var expectedResult = contacts.map((name) => Contact(name: name)).toList();
    // Act
    var contactsResponse = await contactsRepository?.fetchContacts();
    // Assert
    expect(contactsResponse, expectedResult);
  });

  test('searchContacts to return a list of filtered Contacts', () async {
    // Arrange
    const String query = 'and';
    var expectedResult = [Contact(name: "Andy")];
    // Act
    var contactsResponse = await contactsRepository?.searchContacts(query);
    // Assert
    expect(expectedResult, contactsResponse);
  });

  test('searchContacts to return a list of all Contacts if query is empty', () async {
    // Arrange
    const String query = '';
    var expectedResult = contacts.map((name) => Contact(name: name)).toList();
    // Act
    var contactsResponse = await contactsRepository?.searchContacts(query);
    // Assert
    expect(expectedResult, contactsResponse);
  });

}

// Mocks and Stubs
class ContactsAPIStub implements ContactsAPI {
  List<String> contacts;

  ContactsAPIStub(this.contacts);

  @override
  Future<dynamic> getContacts() {
    return Future.value(contacts);
  }
}