part of 'contacts_list_bloc.dart';

abstract class ContactsListEvent extends Equatable {
  const ContactsListEvent();
}

class ContactsListFetchContacts extends ContactsListEvent {
  const ContactsListFetchContacts();

  @override
  List<Object?> get props => [];
}

class ContactsListSearchContacts extends ContactsListEvent {
  final String query;
  const ContactsListSearchContacts(this.query);

  @override
  List<Object?> get props => [query];
}