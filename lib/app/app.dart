
import 'package:challenge_about_you/core/contacts_list/contacts_list_screen.dart';
import 'package:challenge_about_you/theme/colors.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge About You',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(color: AppColors.blueF4),
      ),
      home: const ContactsListScreen(),
    );
  }
}