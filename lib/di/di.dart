import 'package:get_it/get_it.dart';

import '../core/routing/navigation_service.dart';
import 'data_sources_di.dart';
import 'externals_di.dart';
import 'providers_di.dart';
import 'repositories_di.dart';
import 'use_cases_di.dart';

GetIt di = GetIt.instance;

void injectDependencies() async {
  initExternals();
  initDataSources();
  initUseCases();
  initRepositories();
  initProviders();
  di.registerLazySingleton(() => NavigationService());
}
