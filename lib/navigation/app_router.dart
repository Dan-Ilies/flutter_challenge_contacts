
import 'package:challenge_about_you/core/contact_details/contact_details_screen.dart';
import 'package:challenge_about_you/core/contacts_list/bloc/contacts_list_bloc.dart';
import 'package:challenge_about_you/core/contacts_list/contacts_list_screen.dart';
import 'package:challenge_about_you/data/models/contact.dart';
import 'package:challenge_about_you/data/repositories/contacts_repository.dart';
import 'package:challenge_about_you/infrastructure/global_functions.dart';
import 'package:challenge_about_you/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {

  final _contactsRepository = ContactsRepositoryImpl();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ContactsListBloc(_contactsRepository)..add(
                const ContactsListGetContacts()
            ),
            child: const ContactsListScreen(),
          ),
        );
      case Routes.contactsList:
        return MaterialPageRoute(builder: (_) => const ContactsListScreen());
      case Routes.contactDetails:
        final contact = cast<Contact>(settings.arguments);
        final contactName = contact?.name ?? '';
        return MaterialPageRoute(builder: (_) =>
            ContactDetailsScreen(contactName: contactName));
      default:
        return MaterialPageRoute(builder: (_) => const ContactsListScreen());
    }
  }

}