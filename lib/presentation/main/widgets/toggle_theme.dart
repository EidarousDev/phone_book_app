import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_colors.dart';
import '../../../core/enums.dart';
import '../../providers/themes_provider.dart';

class ToggleTheme extends StatelessWidget {
  const ToggleTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemesProvider>().theme;
    if(theme == ThemesValues.light) {
      return IconButton(icon: const Icon(Icons.toggle_off_sharp), color: AppColors.darkBackground, onPressed:() => context.read<ThemesProvider>().toggleTheme());
    }
    return IconButton(icon: const Icon(Icons.toggle_on_sharp), color: AppColors.lightBackground, onPressed:() => context.read<ThemesProvider>().toggleTheme());
  }
}
