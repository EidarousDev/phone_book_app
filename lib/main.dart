import 'package:flutter/material.dart';

import 'di/di.dart';
import 'presentation/app_view/app_view.dart';

void main() {
  injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}