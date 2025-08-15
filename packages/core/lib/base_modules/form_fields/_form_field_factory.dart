import 'package:core/base_modules/form_fields/input_validation/validation_enums.dart';
import 'package:core/base_modules/form_fields/keys_for_widgets.dart';
import 'package:core/base_modules/form_fields/widgets/app_text_field.dart';
import 'package:core/base_modules/localization/generated/locale_keys.g.dart';
import 'package:core/base_modules/theme/ui_constants/_app_constants.dart';
import 'package:flutter/material.dart';

/// 🏗️ Factory method that returns a themed [AppTextField], based on the [InputFieldType].
/// Ensures consistent look & feel across forms (SignUp/Login).
//
abstract final class InputFieldFactory {
  ///--------------------------------
  InputFieldFactory._();

  ///
  static Widget create({
    required InputFieldType type,
    required FocusNode focusNode,
    required String? errorText,
    required void Function(String) onChanged,
    bool isObscure = false,
    Widget? suffixIcon,
    VoidCallback? onSubmitted,
  }) {
    ///
    return switch (type) {
      ///
      InputFieldType.name => AppTextField(
        key: AppKeys.nameField,
        focusNode: focusNode,
        label: LocaleKeys.form_name,
        icon: AppIcons.name,
        obscure: false,
        errorKey: errorText,
        keyboardType: TextInputType.name,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),

      ///
      InputFieldType.email => AppTextField(
        key: AppKeys.emailField,
        focusNode: focusNode,
        label: LocaleKeys.form_email,
        icon: AppIcons.email,
        obscure: false,
        errorKey: errorText,
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),

      ///
      InputFieldType.password => AppTextField(
        key: AppKeys.passwordField,
        focusNode: focusNode,
        label: LocaleKeys.form_password,
        icon: AppIcons.password,
        obscure: isObscure,
        suffixIcon: suffixIcon,
        errorKey: errorText,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),

      ///
      InputFieldType.confirmPassword => AppTextField(
        key: AppKeys.confirmPasswordField,
        focusNode: focusNode,
        label: LocaleKeys.form_confirm_password,
        icon: AppIcons.confirmPassword,
        obscure: isObscure,
        suffixIcon: suffixIcon,
        errorKey: errorText,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),

      //
    };
  }
}
