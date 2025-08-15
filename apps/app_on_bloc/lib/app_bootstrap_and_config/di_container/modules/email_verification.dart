import 'package:app_on_bloc/app_bootstrap_and_config/di_container/core/di_module_interface.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/di_container_init.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/modules/auth_module.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/modules/firebase_module.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/x_on_get_it.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/firebase_config/user_auth_cubit/auth_cubit.dart'
    show AuthCubit;
import 'package:app_on_bloc/features/email_verification/data/email_verification_repo_impl.dart'
    show IUserValidationRepoImpl;
import 'package:app_on_bloc/features/email_verification/data/remote_database_contract.dart'
    show IUserValidationRemoteDataSource;
import 'package:app_on_bloc/features/email_verification/data/remote_database_impl.dart'
    show IUserValidationRemoteDataSourceImpl;
import 'package:app_on_bloc/features/email_verification/domain/email_verification_use_case.dart'
    show EmailVerificationUseCase;
import 'package:app_on_bloc/features/email_verification/domain/repo_contract.dart'
    show IUserValidationRepo;
import 'package:app_on_bloc/features/email_verification/presentation/email_verification_cubit/email_verification_cubit.dart'
    show EmailVerificationCubit;

///
final class EmailVerificationModule implements DIModule {
  ///-------------------------------------------------
  //
  @override
  String get name => 'EmailVerificationModule';

  ///
  @override
  List<Type> get dependencies => [FirebaseModule, AuthModule];

  ///
  @override
  Future<void> register() async {
    //
    /// Data sources
    di
      ..registerFactoryIfAbsent<IUserValidationRemoteDataSource>(
        IUserValidationRemoteDataSourceImpl.new,
      )
      /// Repositories
      ..registerFactoryIfAbsent<IUserValidationRepo>(
        () => IUserValidationRepoImpl(di()),
      )
      /// Usecases
      ..registerFactoryIfAbsent(() => EmailVerificationUseCase(di()))
      /// Email Verification Cubit
      ..registerFactoryIfAbsent<EmailVerificationCubit>(
        () => EmailVerificationCubit(
          di<EmailVerificationUseCase>(),
          di<AuthCubit>(),
        ),
      );

    //
  }

  ///
  @override
  Future<void> dispose() async {
    await di.safeDispose<EmailVerificationCubit>();
  }

  //
}
