import '../domain/use_cases/contacts/get_contacts_use_case.dart';
import '../domain/use_cases/contacts/update_all_contacts_use_case.dart';
import '../domain/use_cases/themes/change_theme_use_case.dart';
import '../domain/use_cases/themes/get_theme_use_case.dart';
import 'di.dart';

void initUseCases() {
  // Contacts UseCases
  di.registerLazySingleton(() => GetContactsUseCase(di()));
  di.registerLazySingleton(() => UpdateAllContactsUseCase(di()));

  // Themes UseCases
  di.registerLazySingleton(() => GetThemeUseCase(di()));
  di.registerLazySingleton(() => ChangeThemeUseCase(di()));
}
