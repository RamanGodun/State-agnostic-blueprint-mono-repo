import 'package:app_on_bloc/app_bootstrap_and_config/di_container/core/di_module_interface.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/di_container_init.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/modules/firebase_module.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/x_on_get_it.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/firebase_config/user_auth_cubit/auth_cubit.dart';
import 'package:app_on_bloc/features/auth/data/auth_repo_implementations/sign_in_repo_impl.dart'
    show SignInRepoImpl;
import 'package:app_on_bloc/features/auth/data/auth_repo_implementations/sign_out_repo_impl.dart'
    show SignOutRepoImpl;
import 'package:app_on_bloc/features/auth/data/auth_repo_implementations/sign_up_repo_impl.dart'
    show SignUpRepoImpl;
import 'package:app_on_bloc/features/auth/data/data_source_contract.dart'
    show IAuthRemoteDatabase;
import 'package:app_on_bloc/features/auth/data/data_source_impl.dart'
    show AuthRemoteDatabaseImpl;
import 'package:app_on_bloc/features/auth/domain/repo_contracts.dart'
    show ISignInRepo, ISignOutRepo, ISignUpRepo;
import 'package:app_on_bloc/features/auth/domain/use_cases/sign_in.dart'
    show SignInUseCase;
import 'package:app_on_bloc/features/auth/domain/use_cases/sign_out.dart'
    show SignOutUseCase;
import 'package:app_on_bloc/features/auth/domain/use_cases/sign_up.dart'
    show SignUpUseCase;
import 'package:app_on_bloc/features/auth/presentation/sign_out/sign_out_cubit/sign_out_cubit.dart'
    show SignOutCubit;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

///
final class AuthModule implements DIModule {
  ///------------------------------------
  //
  @override
  String get name => 'AuthModule';

  ///
  @override
  List<Type> get dependencies => [FirebaseModule];

  ///
  @override
  Future<void> register() async {
    //
    // Data Sources
    di
      ..registerLazySingletonIfAbsent<IAuthRemoteDatabase>(
        AuthRemoteDatabaseImpl.new,
      )
      //
      /// Repositories
      //
      ..registerFactoryIfAbsent<ISignInRepo>(() => SignInRepoImpl(di()))
      ..registerFactoryIfAbsent<ISignOutRepo>(() => SignOutRepoImpl(di()))
      ..registerLazySingletonIfAbsent<ISignUpRepo>(() => SignUpRepoImpl(di()))
      //
      /// Use Cases
      //
      ..registerFactoryIfAbsent(() => SignInUseCase(di()))
      ..registerFactoryIfAbsent(() => SignUpUseCase(di()))
      ..registerLazySingletonIfAbsent(() => SignOutUseCase(di()))
      //
      /// AuthStreamCubit
      //
      ..registerLazySingletonIfAbsent<AuthCubit>(
        () => AuthCubit(userStream: di<FirebaseAuth>().authStateChanges()),
      )
      //
      // Sign out Cubit
      ..registerFactoryIfAbsent(() => SignOutCubit(di<SignOutUseCase>()));

    //
  }

  ////

  ///
  @override
  Future<void> dispose() async {
    // No resources to dispose for this DI module yet.
  }

  //
}
