import 'package:challenge_about_you/core/contacts_list/bloc/contacts_list_bloc.dart';
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
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Center(
        child: BlocBuilder<ContactsListBloc, ContactsListState>(
          builder: (context, state) {
            if (state is ContactsListReceived) {
              return _contacts(state.contacts);
            }
            return _welcome(context);
          },
        ),
      ),
    );
  }

  Widget _welcome(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Welcome',
          style: AppTextStyles.mainText(),
        ),
      ],
    );
  }

  Widget _contacts(List<Contact> contacts) {
    return ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        return MaterialButton(
          child: Text(contacts[index].name),
          onPressed: () => Navigator.pushNamed(context, Routes.contactDetails),
        );
      }
    );
  }

}
