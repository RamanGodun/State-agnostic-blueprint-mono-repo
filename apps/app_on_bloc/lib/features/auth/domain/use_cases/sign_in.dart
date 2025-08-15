import 'package:app_on_bloc/features/auth/domain/repo_contracts.dart';
import 'package:core/base_modules/errors_handling/core_of_module/core_utils/errors_observing/result_loggers/result_logger_x.dart';
import 'package:core/utils_shared/type_definitions.dart' show ResultFuture;

/// 📦 [SignInUseCase] — Handles user authentication logic, using [ISignInRepo]
//
final class SignInUseCase {
  ///-------------------
  const SignInUseCase(this.authRepo);

  ///
  final ISignInRepo authRepo;

  //
  /// 🔐 Signs in with provided credentials
  ResultFuture<void> call({required String email, required String password}) =>
      authRepo.signIn(email: email, password: password)
        ..log()
        ..logSuccess('SignInUseCase success');
  //
}
