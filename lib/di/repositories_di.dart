import '../data/repositories/contacts_repo_impl.dart';
import '../data/repositories/settings_repo_impl.dart';
import '../domain/repositories/contacts_repo.dart';
import '../domain/repositories/settings_repo.dart';
import 'di.dart';

void initRepositories() {
  di.registerLazySingleton<ContactsRepo>(() => ContactsRepoImpl(di()));
  di.registerLazySingleton<SettingsRepo>(() => SettingsRepoImpl(di()));
}
