import 'package:flutter/material.dart';

import '../../core/text_limits.dart';

class InputTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final int? maxLength;
  final TextEditingController? controller;
  final Function(String value) onChanged;
  const InputTextField({super.key, required this.hint, required this.onChanged, this.maxLength, required this.icon, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        if (value.length > 1) {
          // start the event
          onChanged(value);
        }
      },
      maxLength: maxLength ?? TextLimits.searchFieldMaxLength,
      decoration: InputDecoration(
          counterText: "",
          isDense: true,
          prefixIcon: Icon(icon),
          hintText: hint,
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.only(
              left: 11.0, top: 8.0, bottom: 4.0)),
    );
  }
}
