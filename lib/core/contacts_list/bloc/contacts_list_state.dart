part of 'contacts_list_bloc.dart';

abstract class ContactsListState extends Equatable {
  const ContactsListState();
}

class ContactsListInitial extends ContactsListState {
  @override
  List<Object> get props => [];
}

class ContactsListLoading extends ContactsListState {
  @override
  List<Object?> get props => [];
}

class ContactsListReceivedData extends ContactsListState {
  final Map<String, List<Contact>> contactsMap;
  const ContactsListReceivedData(this.contactsMap);

  @override
  List<Object?> get props => [contactsMap];
}

class ContactsListError extends ContactsListState {
  final String message;
  const ContactsListError(this.message);

  @override
  List<Object?> get props => [message];
}