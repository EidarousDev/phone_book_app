import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class SettingsRepo {
  Future<Either<Failure, String?>> getTheme();
  Future<Either<Failure, Unit>> changeTheme(String theme);
}
