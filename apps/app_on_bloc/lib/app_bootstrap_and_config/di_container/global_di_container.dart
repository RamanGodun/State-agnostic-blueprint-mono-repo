import 'package:app_on_bloc/app_bootstrap_and_config/di_container/di_container_init.dart';
import 'package:app_on_bloc/app_bootstrap_and_config/firebase_config/user_auth_cubit/auth_cubit.dart';
import 'package:app_on_bloc/features/email_verification/presentation/email_verification_cubit/email_verification_cubit.dart'
    show EmailVerificationCubit;
import 'package:app_on_bloc/features/profile/presentation/cubit/profile_page_cubit.dart'
    show ProfileCubit;
import 'package:core/base_modules/overlays/overlays_dispatcher/overlay_status_cubit.dart'
    show OverlayStatusCubit;
import 'package:core/base_modules/theme/theme_providers_or_cubits/theme_cubit.dart'
    show AppThemeCubit;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 📦 [GlobalProviders] — Wraps all global Blocs with providers for the app
//
final class GlobalProviders extends StatelessWidget {
  ///---------------------------------------------
  const GlobalProviders({required this.child, super.key});

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    //
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: di<AppThemeCubit>()),
        BlocProvider.value(value: di<OverlayStatusCubit>()),

        BlocProvider.value(value: di<AuthCubit>()),
        BlocProvider.value(value: di<ProfileCubit>()),

        BlocProvider.value(value: di<EmailVerificationCubit>()),

        // others...
      ],
      child: child,
    );
  }
}
