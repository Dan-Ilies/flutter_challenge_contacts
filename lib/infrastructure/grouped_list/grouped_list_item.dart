
import 'package:challenge_about_you/theme/colors.dart';
import 'package:challenge_about_you/theme/test_styles.dart';
import 'package:flutter/material.dart';

// region Abstract Class to be inherited
abstract class ListItem {
  Widget build(BuildContext context);
}
// endregion

// region Custom Classes for the Grouped List
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
  final VoidCallback onPressed;

  AddressBookContact(this.name, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          name,
          style: AppTextStyles.mainText(fontSize: 14),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
// endregion