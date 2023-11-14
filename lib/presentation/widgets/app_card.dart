import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  const AppCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.52,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: AppColors.darkDivider,
              spreadRadius: 0,
              offset: Offset(0, 0), // shadow direction: bottom right
            )
          ],
          color: AppColors.lightCard,
          border: Border.all(color: AppColors.lightDivider),
          borderRadius: const BorderRadius.all(Radius.circular(3.0)),
        ),
        child: child);
  }
}