// 📌 No need for public API docs.
// ignore_for_file: public_member_api_docs

import 'package:app_on_riverpod/app_bootstrap_and_config/di_container/read_di_x_on_context.dart';
import 'package:core/base_modules/animations/module_core/_animation_engine.dart';
import 'package:core/base_modules/animations/overlays_animation/animation_wrapper/animated_overlay_shell.dart';
import 'package:core/base_modules/localization/module_widgets/text_widget.dart';
import 'package:core/base_modules/overlays/core/enums_for_overlay_module.dart';
import 'package:core/base_modules/overlays/overlays_dispatcher/_overlay_dispatcher.dart';
import 'package:core/base_modules/overlays/overlays_dispatcher/overlay_dispatcher_provider.dart';
import 'package:core/base_modules/overlays/overlays_presentation/overlay_presets/overlay_preset_props.dart';
import 'package:core/base_modules/theme/ui_constants/_app_constants.dart';
import 'package:core/base_modules/theme/widgets_and_utils/barrier_filter.dart';
import 'package:core/base_modules/theme/widgets_and_utils/box_decorations/_box_decorations_factory.dart';
import 'package:core/base_modules/theme/widgets_and_utils/extensions/theme_x.dart';
import 'package:core/utils_shared/extensions/extension_on_widget/_widget_x_barrel.dart';
import 'package:flutter/cupertino.dart';

/// 🍎 [IOSAppDialog] — Animated glass-style Cupertino dialog for iOS/macOS
/// - Fade + scale animation
/// - Improved visibility in light theme with soft gray transparent background
/// - Fully uses AppColors
//
final class IOSAppDialog extends StatelessWidget {
  /// ─────────────────────────────────────────
  const IOSAppDialog({
    required this.title,
    required this.content,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
    required this.presetProps,
    required this.isInfoDialog,
    required this.isFromUserFlow,
    required this.engine,
    super.key,
  });

  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final OverlayUIPresetProps? presetProps; // 🎨 Optional style preset
  final bool isInfoDialog;
  final bool isFromUserFlow;
  final AnimationEngine engine;

  //

  @override
  Widget build(BuildContext context) {
    //
    final dispatcher = context.readDI(overlayDispatcherProvider);
    //
    final isDark = context.isDarkMode;
    final colorScheme = context.colorScheme;
    final decoration = BoxDecorationFactory.iosDialog(isDark: isDark);

    return AnimatedOverlayShell(
      engine: engine,
      child: Stack(
        children: [
          OverlayBarrierFilter.resolve(
            isDark: isDark,
            level: OverlayBlurLevel.soft,
          ),

          Container(
            decoration: decoration,

            child: CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    title,
                    TextType.titleMedium,
                    isTextOnFewStrings: true,
                  ),
                ],
              ).centered(),

              content: Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xxxs),
                child: TextWidget(
                  content,
                  TextType.bodyLarge,
                  fontWeight: FontWeight.w200,
                  isTextOnFewStrings: true,
                ),
              ),

              actions: isInfoDialog
                  ? [
                      CupertinoDialogAction(
                        onPressed:
                            onConfirm ?? () => _fallback(dispatcher, onConfirm),
                        // onPressed: _wrapWithDismiss(dispatcher, onConfirm),
                        isDefaultAction: true,
                        child: TextWidget(
                          confirmText,
                          TextType.button,
                          color: colorScheme.primary,
                        ),
                      ),
                    ]
                  : [
                      CupertinoDialogAction(
                        onPressed:
                            onCancel ?? () => _fallback(dispatcher, onCancel),
                        // onPressed: _wrapWithDismiss(dispatcher, onCancel),
                        child: TextWidget(
                          cancelText,
                          TextType.button,
                          color: colorScheme.error,
                        ),
                      ),
                      CupertinoDialogAction(
                        onPressed:
                            onConfirm ?? () => _fallback(dispatcher, onConfirm),
                        // onPressed: _wrapWithDismiss(dispatcher, onConfirm),
                        isDefaultAction: true,
                        child: TextWidget(
                          confirmText,
                          TextType.button,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }

  ///
  void _fallback(OverlayDispatcher dispatcher, VoidCallback? action) {
    dispatcher.dismissCurrent(force: true);
    action?.call();
  }

  /// Option with dialog auto-closing, when action is given
  // ignore: unused_element
  VoidCallback _wrapWithDismiss(
    OverlayDispatcher dispatcher,
    VoidCallback? action,
  ) {
    return () {
      dispatcher.dismissCurrent(force: true);
      action?.call();
    };
  }

  //
}
