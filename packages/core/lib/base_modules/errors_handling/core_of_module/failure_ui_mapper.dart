import 'package:core/base_modules/errors_handling/core_of_module/failure_entity.dart';
import 'package:core/base_modules/errors_handling/core_of_module/failure_ui_entity.dart';
import 'package:core/base_modules/errors_handling/extensible_part/failure_extensions/failure_icons_x.dart';

/// ✅ [FailureToUIEntityX] — Maps domain-level [Failure] to a presentational [FailureUIEntity]
/// ✅ Provides safe localization fallback and diagnostics logging
/// ✅ Ensures consistent UI rendering with localized text, error code, and icon
//
extension FailureToUIEntityX on Failure {
  ///
  FailureUIEntity toUIEntity() {
    // final hasTranslation = type.translationKey.isNotEmpty;
    final hasMessage = message?.isNotEmpty ?? false;

    /// ! 🧩 Resolved text without localization (after will be deleted)
    final resolvedText = hasMessage ? message! : type.code;

    /*
    ! restore after adding localization module:

    final resolvedText = switch ((hasTranslation, hasMessage)) {
      (true, true) => AppLocalizer.translateSafely(
        type.translationKey,
        fallback: message,
      ),
      (true, false) => AppLocalizer.translateSafely(type.translationKey),
      (false, true) => message!,
      _ => type.code,
    };

    if (hasTranslation && resolvedText == message) {
      LocalizationLogger.fallbackUsed(type.translationKey, message!);
    }

 */

    return FailureUIEntity(
      localizedMessage: resolvedText,
      formattedCode: safeCode,
      icon: type.icon,
    );
  }
}
