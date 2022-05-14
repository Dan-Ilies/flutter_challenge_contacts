
import 'package:challenge_about_you/theme/test_styles.dart';
import 'package:flutter/material.dart';

class ContactDetailsScreen extends StatelessWidget {

  final String _contactName;

  const ContactDetailsScreen({Key? key, String contactName = "N/A"})
      : _contactName = contactName,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _contactName,
              style: AppTextStyles.mainHeader(),
            ),
          ],
        ),
      ),
    );
  }

}