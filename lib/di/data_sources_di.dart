import '../data/data_sources/local/contacts_local_data_source.dart';
import '../data/data_sources/local/storage_data_source.dart';
import 'di.dart';

void initDataSources() {
  di.registerLazySingleton<ContactsLocalDataSource>(
      () => ContactsLocalDataSourceImpl(di()));
  di.registerLazySingleton<StorageDataSource>(
      () => StorageDataSourceImpl(di()));
}
