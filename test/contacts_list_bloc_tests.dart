
import 'package:bloc_test/bloc_test.dart';
import 'package:challenge_about_you/core/contacts_list/bloc/contacts_list_bloc.dart';
import 'package:challenge_about_you/data/models/contact.dart';
import 'package:challenge_about_you/data/repositories/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ContactsListBloc contactsListBloc;
  final List<Contact> contacts = [
    const Contact(name: 'Andy'),
    const Contact(name: 'Mary'),
  ];

  setUp(() {
    var contactsRepository = ContactsRepositoryStub(contacts);
    contactsListBloc = ContactsListBloc(contactsRepository);
  });

  test('initial state check', () {
    expect(contactsListBloc.state, ContactsListInitial());
  });

  blocTest<ContactsListBloc, ContactsListState>(
      'emits a Loading state and then the Contacts map when fetching Contacts',
      build: () => contactsListBloc,
      act: (bloc) => bloc.add(const ContactsListFetchContacts()),
      expect: () => [
        ContactsListLoading(),
        const ContactsListReceivedData({
          'A': [Contact(name: 'Andy')],
          'M': [Contact(name: 'Mary')],
        }),
      ]
  );

  blocTest<ContactsListBloc, ContactsListState>(
      'emits an expected Contacts map when searching by a query',
      build: () => contactsListBloc,
      act: (bloc) => bloc.add(const ContactsListSearchContacts('ma')),
      expect: () => [
        const ContactsListReceivedData({
          'M': [Contact(name: 'Mary')],
        }),
      ]
  );

}

// Mocks and Stubs
class ContactsRepositoryStub implements ContactsRepository {
  final List<Contact> contacts;

  ContactsRepositoryStub(this.contacts);

  @override
  Future<List<Contact>> fetchContacts() {
    return Future.value(contacts);
  }

  @override
  Future<List<Contact>> searchContacts(String query) {
    var filteredContacts = contacts.where((contact) =>
        contact.name.toLowerCase().contains(query.toLowerCase())).toList();
    return Future.value(filteredContacts);
  }



}