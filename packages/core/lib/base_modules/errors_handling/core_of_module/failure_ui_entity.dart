import 'package:core/base_modules/errors_handling/core_of_module/failure_type.dart'
    show FailureType;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter/material.dart';
import 'package:meta/meta.dart' show sealed;

/// 🧩 [FailureUIEntity] — UI-layer representation of a domain failure
/// ✅ Uses i18n translation key from [FailureType]
/// ✅ Contains icon and human-readable error code
///
@sealed
final class FailureUIEntity extends Equatable {
  ///---------------------------------------
  const FailureUIEntity({
    required this.localizedMessage,
    required this.formattedCode,
    required this.icon,
  });

  ///📝 Localized error text for display
  final String localizedMessage;

  ///🔖 e.g., "401" or "FIREBASE"
  final String formattedCode;

  ///🎨 Icon representing error type
  final IconData icon;

  ///
  @override
  List<Object?> get props => [localizedMessage, formattedCode, icon];

  //
}
