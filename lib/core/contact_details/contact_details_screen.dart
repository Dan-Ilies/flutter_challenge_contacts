
import 'package:flutter/material.dart';

class ContactDetailsScreen extends StatelessWidget {
  const ContactDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Contact Details'),
            const SizedBox(height: 30),
            MaterialButton(
              child: const Text("Back"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }

}