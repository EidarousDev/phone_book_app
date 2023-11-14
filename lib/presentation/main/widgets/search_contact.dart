import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_colors.dart';
import '../../../core/text_limits.dart';
import '../../../core/translation_keys.dart';
import '../../providers/contacts_provider.dart';

class SearchContact extends StatelessWidget {
  const SearchContact({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.length > 1) {
          // Filter contacts
          context.read<ContactsProvider>().searchContact(value);
        } else{
          // Clear Search
          context.read<ContactsProvider>().clearSearch();
        }
      },
      maxLength: TextLimits.searchFieldMaxLength,
      decoration: InputDecoration(
          counterText: "",
          isDense: true,
        prefixIcon: Icon(Icons.search),
          hintText: S.searchContactHint,
          hintStyle: TextStyle(color: Theme.of(context)
              .textTheme
              .titleSmall
              ?.color ??
              AppColors.primaryColor,),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.only(
              left: 11.0, top: 8.0, bottom: 4.0)),
    );
  }
}
