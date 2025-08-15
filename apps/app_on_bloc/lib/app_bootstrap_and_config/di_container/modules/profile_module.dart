import 'package:app_on_bloc/app_bootstrap_and_config/di_container/core/di_module_interface.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/di_container_init.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/modules/auth_module.dart'
    show AuthModule;
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/modules/firebase_module.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/x_on_get_it.dart';
import 'package:app_on_bloc/features/profile/data/implementation_of_profile_fetch_repo.dart'
    show ProfileRepoImpl;
import 'package:app_on_bloc/features/profile/data/remote_database_contract.dart'
    show IProfileRemoteDatabase;
import 'package:app_on_bloc/features/profile/data/remote_database_impl.dart'
    show ProfileRemoteDatabaseImpl;
import 'package:app_on_bloc/features/profile/domain/fetch_profile_use_case.dart'
    show FetchProfileUseCase;
import 'package:app_on_bloc/features/profile/domain/repo_contract.dart'
    show IProfileRepo;
import 'package:app_on_bloc/features/profile/presentation/cubit/profile_page_cubit.dart'
    show ProfileCubit;
import 'package:cloud_firestore/cloud_firestore.dart' show CollectionReference;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

///
final class ProfileModule implements DIModule {
  ///---------------------------------------
  //
  @override
  String get name => 'ProfileModule';

  ///
  @override
  List<Type> get dependencies => [FirebaseModule, AuthModule];
  //

  ///
  @override
  Future<void> register() async {
    //
    // Data Sources
    di
      ..registerLazySingletonIfAbsent<IProfileRemoteDatabase>(
        () => ProfileRemoteDatabaseImpl(
          di<CollectionReference<Map<String, dynamic>>>(),
          di<FirebaseAuth>(),
        ),
      )
      // Repositories
      ..registerLazySingletonIfAbsent<IProfileRepo>(() => ProfileRepoImpl(di()))
      // Use Cases
      ..registerLazySingletonIfAbsent(() => FetchProfileUseCase(di()))
      // Global Profile cubit
      ..registerLazySingletonIfAbsent<ProfileCubit>(
        () => ProfileCubit(di<FetchProfileUseCase>()),
      );

    //
  }

  ///
  @override
  Future<void> dispose() async {
    // No resources to dispose for this DI module yet.
  }

  //
}
