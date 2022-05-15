import 'package:challenge_about_you/core/contacts_list/bloc/contacts_list_bloc.dart';
import 'package:challenge_about_you/data/models/contact.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_delegate.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_item.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_view.dart';
import 'package:challenge_about_you/navigation/routes.dart';
import 'package:challenge_about_you/theme/colors.dart';
import 'package:challenge_about_you/theme/test_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsListScreen extends StatelessWidget implements GroupedListDelegate {
  const ContactsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ContactsListBloc, ContactsListState>(
          builder: (context, state) {
            if (state is ContactsListLoading) {
              return _loadingIndicator();
            }
            if (state is ContactsListReceived) {
              return _groupedListView(context, state.contacts);
            }
            return _welcome(context);
          },
        ),
      ),
    );
  }

  Widget _welcome(BuildContext context) {
    return Text(
      'Welcome',
      style: AppTextStyles.mainText(),
    );
  }

  Widget _loadingIndicator() {
    return const CircularProgressIndicator();
  }

  Widget _groupedListView(BuildContext context, List<Contact> contacts) {
    return GroupedListView(
      title: 'Contacts',
      items: addressBookList(context, contacts),
      groupedListDelegate: this,
      header: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'The header',
          style: AppTextStyles.mainText(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'App Version: 1.0',
          style: AppTextStyles.mainText(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.grayA7,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  List<ListItem> addressBookList(BuildContext context, List<Contact> contacts) {
    contacts.sort((first, second) {
      return first.name.toLowerCase().compareTo(second.name.toLowerCase());
    });
    List<ListItem> items = [];
    var sectionLetter = '';
    for (var contact in contacts) {
      final currentSectionLetter = contact.name[0].toUpperCase();
      if (sectionLetter != currentSectionLetter) {
        items.add(AddressBookHeader(currentSectionLetter));
        sectionLetter = currentSectionLetter;
      }
      items.add(
        AddressBookContact(
          contact.name, () => {
          Navigator.pushNamed(
            context,
            Routes.contactDetails,
            arguments: contact,
          ),
        },
        ),
      );
    }
    return items;
  }

  // region GroupedListDelegate
  @override
  didSearch(BuildContext context, String query) {
    final bloc = BlocProvider.of<ContactsListBloc>(context);
    bloc.add(ContactsListSearchContacts(query));
  }

  @override
  didRefresh(BuildContext context) {
    final bloc = BlocProvider.of<ContactsListBloc>(context);
    bloc.add(const ContactsListFetchContacts());
  }
  // endregion

}
