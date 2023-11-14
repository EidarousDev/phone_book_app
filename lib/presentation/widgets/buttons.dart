import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Function onTap;
  const AppButton(
      {super.key, required this.text, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // <-- Radius
        ),
      ),
      child: Text(text),
    );
  }
}

class DeleteButton extends StatelessWidget {
  final Function onTap;
  const DeleteButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.errorColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      child: const Icon(Icons.delete),
    );
  }
}
