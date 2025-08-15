import 'package:app_on_riverpod/features/auth/data/remote_database_contract.dart';
import 'package:app_on_riverpod/features/auth/domain/repo_contracts.dart';
import 'package:core/base_modules/errors_handling/core_of_module/_run_errors_handling.dart';
import 'package:core/utils_shared/type_definitions.dart' show ResultFuture;

/// 🧩 [SignInRepoImpl] — sign-in in [IAuthRemoteDatabase] with errors mapping
//
final class SignInRepoImpl implements ISignInRepo {
  ///---------------------------------------------
  const SignInRepoImpl(this._remote);
  //
  final IAuthRemoteDatabase _remote;

  //
  @override
  ResultFuture<void> signIn({
    required String email,
    required String password,
  }) => (() => _remote.signIn(
    email: email,
    password: password,
  )).runWithErrorHandling();
}
