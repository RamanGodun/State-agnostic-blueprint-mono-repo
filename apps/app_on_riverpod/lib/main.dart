import 'package:app_on_riverpod/app_bootstrap_and_config/app_bootstrap.dart'
    show AppBootstrap;
import 'package:app_on_riverpod/root_view_shell.dart';
import 'package:core/base_modules/di_container/di_container.dart'
    show GlobalDIContainer;
import 'package:core/base_modules/localization/core_of_module/localization_wrapper.dart'
    show LocalizationWrapper;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 🏁 Application entry point
//
Future<void> main() async {
  ///
  final appBootstrap = AppBootstrap(
    // ? Here can be plugged in custom dependencies (e.g.  "localStorage: IsarLocalStorage()," )
  );

  /// 🚀 Runs all startup logic (localization, Firebase, DI container, debug tools, local storage, etc).
  await appBootstrap.initAllServices();

  ////

  /// 🏁🚀 Launches the app with ProviderScope using the global container as parent.
  runApp(
    ProviderScope(
      parent: GlobalDIContainer.instance,
      child: const AppLocalizationShell(),
    ),
  );
}

////

////

/// 🌍✅ [AppLocalizationShell] — Ensures the entire app tree is properly localized before rendering the root UI.
//
final class AppLocalizationShell extends StatelessWidget {
  ///----------------------------------------------
  const AppLocalizationShell({super.key});

  @override
  Widget build(BuildContext context) {
    //
    /// Injects localization context into the widget tree (provides all supported locales and translation assets)
    return LocalizationWrapper.configure(const AppRootViewShell());
  }
}
