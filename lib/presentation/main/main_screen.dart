import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_config.dart';
import '../../core/routing/app_routes.dart';
import '../../core/routing/navigation_keys.dart';
import '../../core/text_styles.dart';
import '../../core/translation_keys.dart';
import '../providers/contacts_provider.dart';
import '../widgets/app_card.dart';
import '../widgets/buttons.dart';
import '../widgets/spaces.dart';
import '../widgets/transparent_app_bar.dart';
import 'widgets/contact_list_tile.dart';
import 'widgets/search_contact.dart';
import 'widgets/toggle_theme.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(builder: (context, provider, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const TransparentAppBar(
          icon: Icon(Icons.perm_contact_cal),
          title: AppConfig.appName,
          actions: [
            ToggleTheme(),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    S.contacts,
                    style: TextStyles.largeBold,
                  ),
                  const Spacer(),
                  AppButton(
                    text: S.addContact,
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.addContact);
                    },
                  ),
                ],
              ),
              const VerticalSpace(16.0),
              const SearchContact(),
              const VerticalSpace(16.0),
              AppCard(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.filteredContacts.isNotEmpty ? provider.filteredContacts.length : provider.contacts.length,
                  itemBuilder: (context, index) {
                    final contact = provider.filteredContacts.isNotEmpty ? provider.filteredContacts[index] : provider.contacts[index];
                    return Column(
                      children: [
                        ContactListTile(
                          contact: contact,
                          onTap: () => Navigator.of(context).pushNamed(
                              AppRoutes.contactDetails,
                              arguments: {NavigationKeys.contact: contact}),
                        ),
                        const FullWidthDivider(
                          thickness: 0.5,
                        )
                      ],
                    );
                  },
                ),
              ),
              const VerticalSpace(16.0),
              const Text(S.credits),
            ],
          ),
        ),
      );
    });
  }
}
