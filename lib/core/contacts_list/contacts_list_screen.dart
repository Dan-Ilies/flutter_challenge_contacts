import 'package:challenge_about_you/core/contacts_list/bloc/contacts_list_bloc.dart';
import 'package:challenge_about_you/data/models/contact.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_delegate.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_item.dart';
import 'package:challenge_about_you/infrastructure/grouped_list/grouped_list_view.dart';
import 'package:challenge_about_you/navigation/routes.dart';
import 'package:challenge_about_you/theme/colors.dart';
import 'package:challenge_about_you/theme/test_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_about_you/infrastructure/extensions/string_extensions.dart';

class ContactsListScreen extends StatelessWidget implements GroupedListDelegate {
  const ContactsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ContactsListBloc, ContactsListState>(
          builder: (context, state) {
            if (state is ContactsListLoading) {
              return _loadingIndicator();
            }
            if (state is ContactsListReceivedData) {
              return _groupedListView(context, state.contactsMap);
            }
            if (state is ContactsListError) {
              return _errorMessage(context, state.message);
            }
            return _welcome(context);
          },
        ),
      ),
    );
  }

  Widget _welcome(BuildContext context) {
    return Text(
      'Welcome',
      style: AppTextStyles.mainText(),
    );
  }

  Widget _loadingIndicator() {
    return const CircularProgressIndicator();
  }

  Widget _errorMessage(BuildContext context, String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: AppTextStyles.mainText(color: AppColors.grayA7),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.violet3B,
          ),
          child: Text(
            'Try Again',
            style: AppTextStyles.mainText(color: Colors.white),
          ),
          onPressed: () {
            BlocProvider.of<ContactsListBloc>(context)
                .add(const ContactsListFetchContacts());
          },
        ),
      ],
    );
  }

  Widget _groupedListView(BuildContext context, Map<String, List<Contact>> contactsMap) {
    return GroupedListView(
      title: 'Contacts',
      items: addressBookList(context, contactsMap),
      groupedListDelegate: this,
      header: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'The header',
          style: AppTextStyles.mainText(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'App Version: 1.0',
          style: AppTextStyles.mainText(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.grayA7,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  List<ListItem> addressBookList(BuildContext context, Map<String, List<Contact>> contactsMap) {
    List<ListItem> items = [];
    contactsMap.forEach((section, contacts) {
      items.add(AddressBookHeader(section));
      items.addAll(contacts.map((contact) =>
          AddressBookContact(contact.name, () => {
            Navigator.pushNamed(
              context,
              Routes.contactDetails,
              arguments: contact,
            ),
          },
          ),
      ));
    });
    return items;
  }

  // region GroupedListDelegate
  @override
  didSearch(BuildContext context, String query) {
    final bloc = BlocProvider.of<ContactsListBloc>(context);
    bloc.add(ContactsListSearchContacts(query));
  }

  @override
  didRefresh(BuildContext context) {
    final bloc = BlocProvider.of<ContactsListBloc>(context);
    bloc.add(const ContactsListFetchContacts());
  }
  // endregion

}
