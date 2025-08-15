import 'package:app_on_bloc/features/auth/data/data_source_contract.dart';
import 'package:app_on_bloc/features/auth/domain/repo_contracts.dart';
import 'package:core/base_modules/errors_handling/core_of_module/_run_errors_handling.dart';
import 'package:core/utils_shared/type_definitions.dart' show ResultFuture;

/// 🧩 [SignOutRepoImpl] — sign-out from [IAuthRemoteDatabase] with errors mapping
//
final class SignOutRepoImpl implements ISignOutRepo {
  ///---------------------------------------------
  const SignOutRepoImpl(this._remote);
  //
  final IAuthRemoteDatabase _remote;

  //
  @override
  ResultFuture<void> signOut() => _remote.signOut.runWithErrorHandling();
}
