import 'package:app_on_riverpod/app_bootstrap_and_config/firebase_config/firebase_constants.dart';
import 'package:app_on_riverpod/features/auth/presentation/sign_out/sign_out_provider.dart';
import 'package:app_on_riverpod/features/email_verification/presentation/provider/email_verification_provider.dart';
import 'package:core/base_modules/errors_handling/core_of_module/core_utils/specific_for_riverpod/show_dialog_when_error_x.dart';
import 'package:core/base_modules/localization/generated/locale_keys.g.dart'
    show LocaleKeys;
import 'package:core/base_modules/localization/module_widgets/text_widget.dart';
import 'package:core/base_modules/theme/ui_constants/_app_constants.dart'
    show AppSpacing;
import 'package:core/base_modules/theme/ui_constants/app_colors.dart'
    show AppColors;
import 'package:core/base_modules/theme/widgets_and_utils/extensions/theme_x.dart';
import 'package:core/shared_presentation_layer/shared_widgets/buttons/text_button.dart';
import 'package:core/shared_presentation_layer/shared_widgets/loader.dart';
import 'package:core/utils_shared/extensions/extension_on_widget/_widget_x_barrel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'widgets_for_email_verification_page.dart';

/// 🧼 [VerifyEmailPage] — screen that handles email verification polling
/// Automatically redirects when email gets verified
//
final class VerifyEmailPage extends ConsumerWidget {
  ///--------------------------------------------
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    /// ⛑️ Error listener
    ref
      ..listenRetryAwareFailure(
        emailVerificationNotifierProvider,
        context,
        ref: ref,
        onRetry: () => ref.invalidate(emailVerificationNotifierProvider),
      )
      // 🎯 Trigger the polling logic
      ..read(emailVerificationNotifierProvider);

    final asyncValue = ref.watch(emailVerificationNotifierProvider);

    return Scaffold(
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(context.isDarkMode ? 0.05 : 0.9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),

          child: asyncValue.when(
            //
            loading: () => const AppLoader(),
            error: (_, _) => const VerifyEmailCancelButton(),

            data: (_) => const Column(
              mainAxisSize: MainAxisSize.min,
              children: [_VerifyEmailInfo(), VerifyEmailCancelButton()],
            ).withPaddingSymmetric(h: AppSpacing.xl, v: AppSpacing.xxl),
          ),
        ),
      ),
    );
  }
}
