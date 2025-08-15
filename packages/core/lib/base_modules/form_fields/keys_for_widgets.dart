//
// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// 🗝 [AppKeys] — All ValueKeys used across the app.
/// Centralized for testability, clarity, and consistency.
//
abstract final class AppKeys {
  ///──────────────--------
  const AppKeys._();

  /// 👤 Signup fields
  static const ValueKey<String> nameField = ValueKey('signup_name_field');
  static const ValueKey<String> emailField = ValueKey('signup_email_field');
  static const ValueKey<String> passwordField = ValueKey(
    'signup_password_field',
  );
  static const ValueKey<String> confirmPasswordField = ValueKey(
    'signup_confirm_password_field',
  );

  // 🚀 Submit button
  static const ValueKey<String> submitButtonText = ValueKey(
    'submit_button_text',
  );
  static const ValueKey<String> submitButtonLoader = ValueKey(
    'submit_button_loader',
  );

  //
}
