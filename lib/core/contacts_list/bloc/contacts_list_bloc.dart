import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:challenge_about_you/data/models/contact.dart';
import 'package:challenge_about_you/data/repositories/contacts_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:challenge_about_you/infrastructure/extensions/string_extensions.dart';

part 'contacts_list_event.dart';
part 'contacts_list_state.dart';

class ContactsListBloc extends Bloc<ContactsListEvent, ContactsListState> {

  final ContactsRepository _contactsRepository;

  ContactsListBloc(this._contactsRepository) : super(ContactsListInitial()) {

    on<ContactsListFetchContacts>((event, emit) async {
      emit(ContactsListLoading());
      try {
        List<Contact> contacts = await _contactsRepository.fetchContacts();
        // emit(ContactsListReceived(contacts));
        emit(ContactsListReceivedData(_groupContacts(contacts)));
      } catch (e) {
        emit(ContactsListError(e.toString()));
      }
    });

    on<ContactsListSearchContacts>((event, emit) async {
      List<Contact> contacts = await _contactsRepository
          .searchContacts(event.query);
      emit(ContactsListReceivedData(_groupContacts(contacts)));
    });

  }

  Map<String, List<Contact>> _groupContacts(List<Contact> contacts) {
    contacts.sort((first, second) {
      return first.name.toLowerCase().compareTo(second.name.toLowerCase());
    });
    Map<String, List<Contact>> contactsMap = {};
    for (var contact in contacts) {
      String currentSectionLetter = contact.name[0].toUpperCase();
      // Group together the names with special characters
      if (currentSectionLetter.isSpecialCharacter()) {
        currentSectionLetter = '*';
      }
      if (contactsMap[currentSectionLetter] == null) {
        contactsMap[currentSectionLetter] = [];
      }
      contactsMap[currentSectionLetter]?.add(contact);
    }
    return contactsMap;
  }

}
