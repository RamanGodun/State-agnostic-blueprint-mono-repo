//
// ignore_for_file: public_member_api_docs

import 'package:core/base_modules/errors_handling/core_of_module/failure_ui_entity.dart'
    show FailureUIEntity;
import 'package:core/base_modules/overlays/enums_for_overlay_module.dart'
    show ShowAs;
import 'package:flutter/material.dart';

extension ContextXForOverlays on BuildContext {
  /// 🧠 Handles displaying [FailureUIEntity] (тимчасовий no-op)
  void showError(
    FailureUIEntity model, {
    ShowAs showAs = ShowAs.infoDialog,
    bool isDismissible = false,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    String? confirmText,
    String? cancelText,
  }) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(content: Text(model.localizedMessage)),
  );

  /// 🪧 Shows a banner (тимчасовий snackbar)
  void showUserBanner({
    required String message,
    IconData? icon,
    bool isDismissible = true,
  }) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(icon),
            const SizedBox(width: 8),
          ],
          Expanded(child: Text(message)),
        ],
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );

  /// 💬 Shows a dialog (тимчасовий стандартний)
  void showUserDialog({
    required String title,
    required String content,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isDismissible = true,
    bool isInfoDialog = false,
  }) => showDialog<void>(
    context: this,
    barrierDismissible: isDismissible,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if (cancelText != null)
          TextButton(
            onPressed: () {
              Navigator.of(this).pop();
              onCancel?.call();
            },
            child: Text(cancelText),
          ),
        TextButton(
          onPressed: () {
            Navigator.of(this).pop();
            onConfirm?.call();
          },
          child: Text(confirmText ?? 'OK'),
        ),
      ],
    ),
  );

  /// 🍞 Shows a snackbar (тимчасово напряму)
  void showUserSnackbar({
    required String message,
    IconData? icon,
  }) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(icon),
            const SizedBox(width: 8),
          ],
          Expanded(child: Text(message)),
        ],
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
