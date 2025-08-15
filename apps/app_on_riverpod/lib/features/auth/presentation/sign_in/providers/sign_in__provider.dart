import 'package:app_on_riverpod/features/auth/domain/use_cases/sign_in.dart'
    show SignInUseCase;
import 'package:app_on_riverpod/features/auth/domain/use_cases/use_cases_providers.dart';
import 'package:core/utils_shared/riverpod_specific/safe_async_state.dart'
    show SafeAsyncState;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in__provider.g.dart';

/// 🧩 [signInProvider] — async notifier that handles user sign-in
/// 🧼 Uses [SafeAsyncState] to prevent post-dispose state updates
/// 🧼 Wraps logic in [AsyncValue.guard] for robust error handling
//
@Riverpod(keepAlive: false)
final class SignIn extends _$SignIn with SafeAsyncState<void> {
  ///----------------------------------------------------

  /// 🧱 Initializes safe lifecycle tracking
  @override
  FutureOr<void> build() {
    initSafe();
  }

  /// 🔐 Signs in user with provided email and password
  /// - Delegates auth to [SignInUseCase]
  Future<void> signin({required String email, required String password}) async {
    //
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final useCase = ref.watch(signInUseCaseProvider);
      final result = await useCase(email: email, password: password);
      return result.fold((failure) => throw failure, (_) => null);
    });
  }

  /// 🧼 Resets state to idle after error or submission
  void reset() {
    state = const AsyncData(null);
  }

  //
}
