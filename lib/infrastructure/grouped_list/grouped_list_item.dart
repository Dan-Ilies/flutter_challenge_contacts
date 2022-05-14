
import 'package:challenge_about_you/theme/colors.dart';
import 'package:challenge_about_you/theme/test_styles.dart';
import 'package:flutter/material.dart';

abstract class ListItem {
  Widget build(BuildContext context);
}

class AddressBookHeader extends ListItem {
  final String text;

  AddressBookHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColors.grayBE,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: AppTextStyles.mainText(fontSize: 14),
        ),
      ),
    );
  }
}

class AddressBookContact extends ListItem {
  final String name;

  AddressBookContact(this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Text(
        name,
        style: AppTextStyles.mainText(fontSize: 14),
      ),
    );
  }
}