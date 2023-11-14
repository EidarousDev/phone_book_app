import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'di.dart';

void initExternals() {
  di.registerLazySingleton(() => const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true)));
}
