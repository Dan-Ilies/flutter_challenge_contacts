part of 'contacts_list_bloc.dart';

abstract class ContactsListEvent extends Equatable {
  const ContactsListEvent();
}

class ContactsListGetContacts extends ContactsListEvent {
  const ContactsListGetContacts();

  @override
  List<Object?> get props => [];
}