import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../repositories/settings_repo.dart';
import '../use_case.dart';

class GetThemeUseCase extends UseCase<String?, NoParams> {
  final SettingsRepo settingsRepo;

  GetThemeUseCase(this.settingsRepo);
  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await settingsRepo.getTheme();
  }
}
