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

class ContactsListReceived extends ContactsListState {
  final List<Contact> contacts;
  const ContactsListReceived(this.contacts);

  @override
  List<Object?> get props => [contacts];
}