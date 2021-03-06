
import 'package:challenge_about_you/core/contact_details/contact_details_screen.dart';
import 'package:challenge_about_you/core/contacts_list/bloc/contacts_list_bloc.dart';
import 'package:challenge_about_you/core/contacts_list/contacts_list_screen.dart';
import 'package:challenge_about_you/data/api/contacts_api.dart';
import 'package:challenge_about_you/data/models/contact.dart';
import 'package:challenge_about_you/data/repositories/contacts_repository.dart';
import 'package:challenge_about_you/infrastructure/global_functions.dart';
import 'package:challenge_about_you/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {

  final ContactsRepository _contactsRepository;

  AppRouter({
    required ContactsRepository contactsRepository,
  }) : _contactsRepository = contactsRepository;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
      case Routes.contactsList:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ContactsListBloc(_contactsRepository)..add(
                const ContactsListFetchContacts()
            ),
            child: const ContactsListScreen(),
          ),
        );
      case Routes.contactDetails:
        final contactName = cast<Contact>(settings.arguments)?.name ?? 'N/A';
        return MaterialPageRoute(builder: (_) =>
            ContactDetailsScreen(contactName: contactName));
      default:
        return MaterialPageRoute(builder: (_) => const ContactsListScreen());
    }
  }

}