import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:challenge_about_you/data/models/contact.dart';
import 'package:challenge_about_you/data/repositories/contacts_repository.dart';
import 'package:equatable/equatable.dart';

part 'contacts_list_event.dart';
part 'contacts_list_state.dart';

class ContactsListBloc extends Bloc<ContactsListEvent, ContactsListState> {

  final ContactsRepository _contactsRepository;

  ContactsListBloc(this._contactsRepository) : super(ContactsListInitial()) {

    on<ContactsListFetchContacts>((event, emit) async {
      emit(ContactsListLoading());
      try {
        List<Contact> contacts = await _contactsRepository.fetchContacts();
        emit(ContactsListReceived(contacts));
      } catch (e) {
        emit(ContactsListError(e.toString()));
      }
    });

    on<ContactsListSearchContacts>((event, emit) async {
      List<Contact> contacts = await _contactsRepository
          .searchContacts(event.query);
      emit(ContactsListReceived(contacts));
    });

  }

}
