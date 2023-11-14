import 'package:flutter/material.dart';

import '../../core/app_themes.dart';
import '../../core/enums.dart';
import '../../domain/use_cases/themes/change_theme_use_case.dart';
import '../../domain/use_cases/themes/get_theme_use_case.dart';
import '../../domain/use_cases/use_case.dart';

class ThemesProvider extends ChangeNotifier {
  final ChangeThemeUseCase changeThemeUseCase;
  final GetThemeUseCase getThemeUseCase;

  ThemesProvider(
      {required this.changeThemeUseCase, required this.getThemeUseCase});

  // Private states
  ThemesValues _theme = ThemesValues.light;

  // Getters
  ThemesValues get theme => _theme;

  // Methods
  void toggleTheme() {
    changeThemeUseCase(ThemeParams(
        theme: _theme == ThemesValues.dark
            ? Themes.lightTheme
            : Themes.darkTheme));
    _theme =
        _theme == ThemesValues.dark ? ThemesValues.light : ThemesValues.dark;
    notifyListeners();
  }

  void getCachedTheme() async {
    final result = await getThemeUseCase(NoParams());
    result.fold((failure) {}, (theme) {
      _theme =
          theme == Themes.darkTheme ? ThemesValues.dark : ThemesValues.light;
      notifyListeners();
    });
  }
}
