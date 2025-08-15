import 'package:app_on_riverpod/features/change_or_reset_password/data/password_actions_repo_impl.dart';
import 'package:app_on_riverpod/features/change_or_reset_password/data/remote_database_contract.dart';
import 'package:app_on_riverpod/features/change_or_reset_password/data/remote_database_impl.dart';
import 'package:app_on_riverpod/features/change_or_reset_password/domain/repo_contract.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'data_layer_providers.g.dart';

/// 🧩 [passwordRemoteDatabaseProvider] — provides implementation of [IPasswordRemoteDatabase]
/// ✅ Low-level data access for password-related Firebase actions
//
@riverpod
IPasswordRemoteDatabase passwordRemoteDatabase(Ref ref) =>
    PasswordRemoteDatabaseImpl();

/// 🧩 [passwordRepoProvider] — provides implementation of [IPasswordRepo]
/// 🧼 Adds failure mapping on top of remote data source
/// ✅ Used by domain layer use cases
//
@riverpod
IPasswordRepo passwordRepo(Ref ref) =>
    PasswordRepoImpl(ref.watch(passwordRemoteDatabaseProvider));
