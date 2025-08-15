import 'package:app_on_bloc/features/auth/domain/repo_contracts.dart';
import 'package:core/base_modules/errors_handling/core_of_module/core_utils/errors_observing/result_loggers/result_logger_x.dart';
import 'package:core/utils_shared/type_definitions.dart' show ResultFuture;

/// 📦 [SignOutUseCase] — Handles sign-out logic via [ISignOutRepo]
//
final class SignOutUseCase {
  ///--------------------
  const SignOutUseCase(this.repo);

  ///
  final ISignOutRepo repo;

  ///
  ResultFuture<void> call() => repo.signOut()
    ..log()
    ..logSuccess('SignOutUseCase success');
  //
}
