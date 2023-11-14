import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/app_colors.dart';
import '../../core/app_config.dart';
import '../../core/app_themes.dart';
import '../../core/enums.dart';
import '../../core/routing/app_routes.dart';
import '../../core/routing/navigation_service.dart';
import '../../di/di.dart';
import '../main/main_screen.dart';
import '../providers/contacts_provider.dart';
import '../providers/themes_provider.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactsProvider>(
            create: (_) => di<ContactsProvider>()..getContacts()),
        ChangeNotifierProvider<ThemesProvider>(
            create: (_) => di<ThemesProvider>()..getCachedTheme()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return Consumer<ThemesProvider>(
              builder: (context, themes, child) {
                return MaterialApp(
                  title: AppConfig.appName,
                  color: AppColors.primaryColor,
                  navigatorKey: di<NavigationService>().navigatorKey,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: AppRoutes.generateRoute,
                  theme: Themes.buildTheme(
                      context: context,
                      theme: themes.theme == ThemesValues.light
                          ? Themes.lightTheme
                          : Themes.darkTheme),
                  home: const MainScreen(),
                  builder: EasyLoading.init(),
                );
              }
            );
          }),
    );
  }
}
