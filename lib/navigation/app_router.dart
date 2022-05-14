
import 'package:challenge_about_you/core/contact_details/contact_details_screen.dart';
import 'package:challenge_about_you/core/contacts_list/contacts_list_screen.dart';
import 'package:challenge_about_you/navigation/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(builder: (_) => const ContactsListScreen());
      case Routes.contactsList:
        return MaterialPageRoute(builder: (_) => const ContactsListScreen());
      case Routes.contactDetails:
        return MaterialPageRoute(builder: (_) => const ContactDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ContactsListScreen());
    }
  }

}