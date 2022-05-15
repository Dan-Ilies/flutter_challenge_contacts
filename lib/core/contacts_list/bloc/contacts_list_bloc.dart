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

    on<ContactsListGetContacts>((event, emit) async {
      List<Contact> contacts = await _contactsRepository.getContacts();
      if (event.query.isNotEmpty) {
        var queryLowercase = event.query.toLowerCase();
        contacts = contacts.where((element) =>
            element.name.toLowerCase().contains(queryLowercase)
        ).toList();
      }
      emit(ContactsListReceived(contacts));
    });

  }

}
