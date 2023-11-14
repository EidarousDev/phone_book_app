import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../repositories/settings_repo.dart';
import '../use_case.dart';

class ChangeThemeUseCase extends UseCase<Unit, ThemeParams> {
  final SettingsRepo settingsRepo;

  ChangeThemeUseCase(this.settingsRepo);

  @override
  Future<Either<Failure, Unit>> call(ThemeParams params) async {
    return await settingsRepo.changeTheme(params.theme);
  }
}

class ThemeParams {
  final String theme;

  ThemeParams({required this.theme});
}
