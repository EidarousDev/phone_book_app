import '../presentation/providers/contacts_provider.dart';
import '../presentation/providers/themes_provider.dart';
import 'di.dart';

void initProviders() {
  di.registerFactory(() => ContactsProvider(
      getContactsUseCase: di(), updateAllContactsUseCase: di()));
  di.registerFactory(
      () => ThemesProvider(getThemeUseCase: di(), changeThemeUseCase: di()));
}
