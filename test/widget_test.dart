// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:challenge_about_you/app/app.dart';
import 'package:challenge_about_you/data/api/contacts_api.dart';
import 'package:challenge_about_you/data/repositories/contacts_repository.dart';
import 'package:challenge_about_you/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final contactsAPI = ContactsAPIMock();
    final contactsRepository = ContactsRepositoryImpl(contactsAPI);
    final appRouter = AppRouter(contactsRepository: contactsRepository);
    await tester.pumpWidget(App(appRouter: appRouter));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
