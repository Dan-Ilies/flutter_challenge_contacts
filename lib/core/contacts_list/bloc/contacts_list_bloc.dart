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
      final contacts = await _contactsRepository.getContacts();
      emit(ContactsListReceived(contacts));
    });

  }

}
