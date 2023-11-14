import 'package:flutter/material.dart';

import '../../presentation/add_contact/add_contact_screen.dart';
import '../../presentation/contact_details/contact_details_screen.dart';
import '../../presentation/main/main_screen.dart';
import 'navigation_keys.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String splash = '/splash';
  static const String main = '/main-screen';
  static const String contactDetails = '/contact-details-screen';
  static const String addContact = '/add-contact-screen';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map args = {};
    _currentRoute = settings.name;
    if (settings.arguments != null) {
      args = settings.arguments as Map;
    }

    switch (_currentRoute) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case AppRoutes.addContact:
        return MaterialPageRoute(builder: (_) => const AddContactScreen());
      case AppRoutes.contactDetails:
        return MaterialPageRoute(
            builder: (_) =>
                ContactDetailsScreen(contact: args[NavigationKeys.contact]));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

  static String? _currentRoute;
}
