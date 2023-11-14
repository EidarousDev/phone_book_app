import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  navigateTo(String routeName) {
    if (navigatorKey.currentState != null) {
      return navigatorKey.currentState?.pushNamed(routeName);
    }
  }
}
