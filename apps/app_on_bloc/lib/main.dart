import 'package:app_on_bloc/app_bootstrap_and_config/app_bootstrap/app_bootstrap.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/di_container/global_di_container.dart';
import 'package:app_on_bloc/root_view_shell.dart';
import 'package:core/base_modules/localization/core_of_module/localization_wrapper.dart'
    show LocalizationWrapper;
import 'package:flutter/material.dart';

/// 🏁 Application entry point
//
void main() async {
  ///
  const appBootstrap = AppBootstrap(
    // ? Here can be plugged in custom dependencies (e.g.  "localStorage: IsarLocalStorage()," )
  );

  /// 🚀 Runs all startup logic (localization, Firebase, DI container, debug tools, local storage, etc).
  await appBootstrap.initAllServices();

  /// 🏁 Launches app with all global Cubits/Blocs from DI.
  runApp(const GlobalProviders(child: AppLocalizationShell()));
  //
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
