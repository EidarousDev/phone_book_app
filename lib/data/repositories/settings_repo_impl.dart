import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/storage_keys.dart';
import '../../domain/repositories/settings_repo.dart';
import '../data_sources/local/storage_data_source.dart';

class SettingsRepoImpl implements SettingsRepo {
  final StorageDataSource storageDataSource;

  SettingsRepoImpl(this.storageDataSource);

  @override
  Future<Either<Failure, Unit>> changeTheme(String theme) async {
    try {
      await storageDataSource.write(value: theme, key: StorageKeys.theme);
      return const Right(unit);
    } catch (e) {
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getTheme() async {
    try {
      final theme = await storageDataSource.read(StorageKeys.theme);
      return Right(theme);
    } catch (e) {
      return Left(EmptyCacheFailure());
    }
  }
}
