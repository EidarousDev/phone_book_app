import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/app_colors.dart';
import '../../core/sizes.dart';
import '../../core/translation_keys.dart';
import '../../core/utils/show_snack_bar.dart';
import '../../domain/entities/contact_entity.dart';
import '../providers/contacts_provider.dart';
import '../widgets/buttons.dart';
import '../widgets/input_text_field.dart';
import '../widgets/spaces.dart';
import '../widgets/transparent_app_bar.dart';

class ContactDetailsScreen extends StatefulWidget {
  final Contact contact;
  const ContactDetailsScreen({super.key, required this.contact});

  @override
  State<ContactDetailsScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<ContactDetailsScreen> {
  late TextEditingController _nameController, _phoneController;
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactsProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: const TransparentAppBar(
          title: S.contactDetails,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(widget.contact.avatar),
                    maxRadius: Sizes.largeProfileImageDimen,
                  ),
                  const VerticalSpace(24.0),
                  InputTextField(
                    controller: _nameController,
                    hint: S.enterName,
                    icon: Icons.person,
                    onChanged: (String value) {
                      setState(() {
                        _nameController.text = value;
                      });
                    },
                  ),
                  const VerticalSpace(12.0),
                  InputTextField(
                    controller: _phoneController,
                    hint: S.enterPhone,
                    icon: Icons.phone,
                    onChanged: (String value) {
                      setState(() {
                        _phoneController.text = value;
                      });
                    },
                  ),
                  const VerticalSpace(16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        text: S.updateContacts,
                        onTap: (){
                          if(_nameController.text.isEmpty || _phoneController.text.isEmpty || _phoneController.text.length < 6){
                            showSnackBar(context, S.enterValidContact);
                            return;
                          }
                          context.read<ContactsProvider>().updateContact(
                            contact: widget.contact.copyWith(name: _nameController.text, phone: _phoneController.text),
                            onSuccess: () {
                              Navigator.of(context).pop();
                              showSnackBar(context, S.updatedContact);
                            },
                            onFailure: () =>
                                showSnackBar(context, S.failedUpdateContact));},
                      ),
                      const HorizontalSpace(12.0),
                      AppButton(
                        text: S.cancel,
                        color: AppColors.darkCard,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact.name);
    _phoneController = TextEditingController(text: widget.contact.phone);
  }
}
