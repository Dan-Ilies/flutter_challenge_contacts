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
      body: Center(
        child: BlocBuilder<ContactsListBloc, ContactsListState>(
          builder: (context, state) {
            if (state is ContactsListReceived) {
              return _contactsCustom(state.contacts);
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

  Widget _contactsCustom(List<Contact> contacts) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: 120,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Contacts'),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _row(context, contacts[index].name);
          }, childCount: contacts.length),
        ),
      ],
    );
  }

  Widget _row(BuildContext context, String name) {
    return MaterialButton(
      child: Text(name),
      onPressed: () => Navigator.pushNamed(context, Routes.contactDetails),
    );
  }

}
