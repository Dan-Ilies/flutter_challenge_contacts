import 'package:challenge_about_you/core/contacts_list/bloc/contacts_list_bloc.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_item.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_view.dart';
import 'package:challenge_about_you/navigation/routes.dart';
import 'package:challenge_about_you/theme/test_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/contact.dart';

class ContactsListScreen extends StatelessWidget {
  const ContactsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ContactsListBloc, ContactsListState>(
          builder: (context, state) {
            if (state is ContactsListReceived) {
              return GroupedListView(
                title: 'Contacts',
                elements: addressBookList(context, state.contacts),
              );
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
          contact.name,
            () => { Navigator.pushNamed(context, Routes.contactDetails) },
        ),
      );
    }
    return items;
  }

}
