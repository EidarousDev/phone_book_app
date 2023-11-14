import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_colors.dart';
import '../../../core/sizes.dart';
import '../../../core/text_styles.dart';
import '../../../core/translation_keys.dart';
import '../../../core/utils/show_snack_bar.dart';
import '../../../domain/entities/contact_entity.dart';
import '../../providers/contacts_provider.dart';
import '../../widgets/buttons.dart';

class ContactListTile extends StatelessWidget {
  final Contact contact;
  final Function onTap;
  const ContactListTile(
      {super.key, required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: ListTile(
        iconColor: AppColors.hintColor,
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(contact.avatar),
          maxRadius: Sizes.profileImageDimen,
        ),
        trailing: DeleteButton(
          onTap: () {
            context.read<ContactsProvider>().deleteContact(
                id: contact.id,
                onSuccess: () => showSnackBar(context, S.removedContact),
                onFailure: () => showSnackBar(context, S.failedUpdateContact));
          },
        ),
        title: Text(
          contact.name,
          style: TextStyles.mediumBold,
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.phone,
              color: AppColors.greyCard,
              size: Sizes.smallFontSize,
            ),
            Text(
              contact.phone,
              style: const TextStyle(color: AppColors.greyCard),
            ),
          ],
        ),
      ),
    );
  }
}
