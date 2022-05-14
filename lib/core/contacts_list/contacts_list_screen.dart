
import 'package:flutter/material.dart';

class ContactsListScreen extends StatelessWidget {
  const ContactsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Welcome',
            ),
          ],
        ),
      ),
    );
  }



}
