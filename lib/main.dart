import 'dart:async';
import 'dart:developer';
import 'package:challenge_about_you/data/api/contacts_api.dart';
import 'package:challenge_about_you/data/repositories/contacts_repository.dart';
import 'package:challenge_about_you/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

void main() {
  final contactsAPI = ContactsAPIImpl();
  final contactsRepository = ContactsRepositoryImpl(contactsAPI);
  final appRouter = AppRouter(contactsRepository: contactsRepository);
  final app = App(appRouter: appRouter);
  runZonedGuarded(
          () => runApp(app),
          (error, stackTrace) => log(error.toString(), stackTrace: stackTrace)
  );
}
