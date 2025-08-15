import 'package:app_on_bloc/app_bootstrap_and_config/di_container/core/di_module_interface.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/di_container_init.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/x_on_get_it.dart';
import 'package:core/base_modules/theme/theme_providers_or_cubits/theme_cubit.dart'
    show AppThemeCubit;

/// 🎨 Registers theme Cubit for loader (and later, the main app).
//
final class ThemeModule implements DIModule {
  ///-------------------------------------
  //
  @override
  String get name => 'ThemeModule';

  ///
  @override
  List<Type> get dependencies => const [];

  ///
  @override
  Future<void> register() async {
    di.registerLazySingletonIfAbsent(AppThemeCubit.new);
  }

  ///
  @override
  Future<void> dispose() async {
    // No resources to dispose for this DI module yet.
  }

  //
}
