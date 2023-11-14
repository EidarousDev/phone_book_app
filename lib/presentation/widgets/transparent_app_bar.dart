import 'package:flutter/material.dart';

import '../../core/sizes.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? icon;
  const TransparentAppBar({Key? key, this.title, this.actions, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: icon != null ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? const SizedBox(),
          appBarTitle(),
        ],
      ) : appBarTitle(),
      actions: actions ?? [],
    );
  }

  Widget appBarTitle() => Text(title ?? '', style: TextStyle(
        fontSize: Sizes.h1FontSize, fontWeight: FontWeight.bold));

  @override
  Size get preferredSize => const Size.fromHeight(Sizes.appBarHeight);
}
