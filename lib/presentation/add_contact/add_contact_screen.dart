import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/translation_keys.dart';
import '../../core/utils/show_snack_bar.dart';
import '../providers/contacts_provider.dart';
import '../widgets/buttons.dart';
import '../widgets/input_text_field.dart';
import '../widgets/spaces.dart';
import '../widgets/transparent_app_bar.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  String _name = '', _phone = '';
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: const TransparentAppBar(
          title: S.addContact,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              const VerticalSpace(24.0),
              InputTextField(
                hint: S.enterName,
                icon: Icons.person,
                onChanged: (String value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              const VerticalSpace(12.0),
              InputTextField(
                hint: S.enterPhone,
                icon: Icons.phone,
                onChanged: (String value) {
                  setState(() {
                    _phone = value;
                  });
                },
              ),
              const VerticalSpace(16.0),
              AppButton(
                text: S.addContact,
                onTap: () {
                  if(_name.isEmpty || _phone.isEmpty || _phone.length < 6){
                    showSnackBar(context, S.enterValidContact);
                    return;
                  }
                  context.read<ContactsProvider>().addContact(
                    name: _name,
                    phone: _phone,
                    onSuccess: () {
                      Navigator.of(context).pop();
                      showSnackBar(context, S.addedContact);
                    },
                    onFailure: () =>
                        showSnackBar(context, S.failedUpdateContact));},
              ),
            ],
          )),
        ),
      );
    });
  }
}
