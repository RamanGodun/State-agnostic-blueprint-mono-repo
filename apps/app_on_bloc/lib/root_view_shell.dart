import 'package:app_on_bloc/app_bootstrap_and_config/firebase_config/user_auth_cubit/auth_cubit.dart';
import 'package:app_on_bloc/core/base_moduls/navigation/module_core/go_router_factory.dart';
import 'package:core/base_modules/localization/generated/locale_keys.g.dart';
import 'package:core/base_modules/overlays/core/global_overlay_handler.dart';
import 'package:core/base_modules/theme/module_core/app_theme_preferences.dart'
    show ThemePreferences;
import 'package:core/base_modules/theme/theme_providers_or_cubits/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart' show GoRouter;

/// 🌳🧩 [AppRootViewShell] — Top-level reactive widget listening to [AppThemeCubit].
/// ✅ Rebuilds GoRouter reactively on any AuthState change.
//
final class AppRootViewShell extends StatelessWidget {
  ///------------------------------------------------
  const AppRootViewShell({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    // Listen to navigation state (GoRouter) from AuthCubit.
    return BlocSelector<AuthCubit, AuthState, AuthState>(
      selector: (state) => state,
      builder: (context, authState) {
        final router = buildGoRouter(authState);
        // Listen to current theme preferences from AppThemeCubit.
        return BlocSelector<AppThemeCubit, ThemePreferences, ThemePreferences>(
          selector: (config) => config,
          builder: (context, config) {
            // Pass all resolved config (router + theme) to root view.
            return _AppRootView(
              router: router,
              lightTheme: config.buildLight(),
              darkTheme: config.buildDark(),
              themeMode: config.mode,
            );
          },
        );
      },
    );
  }
}

////

////

/// 📱🧱 [_AppRootView] — Final stateless [MaterialApp.router] widget.
/// ✅ Receives fully resolved config: theme + router + localization.
//
final class _AppRootView extends StatelessWidget {
  ///------------------------------------------
  const _AppRootView({
    required this.router,
    required this.lightTheme,
    required this.darkTheme,
    required this.themeMode,
  });
  //
  final GoRouter router;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;

  //

  @override
  Widget build(BuildContext context) {
    ///
    return MaterialApp.router(
      ///
      title: LocaleKeys.app_title.tr(),

      /// 🌐  Localization setup via EasyLocalization
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,

      /// 🎨 Theme configuration
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,

      /// 🔁 Router setup for declarative navigation
      routerConfig: router,

      // 🧩 Gesture handler to dismiss overlays and keyboard
      builder: (context, child) => GlobalOverlayHandler(child: child!),

      //
    );
  }
}
