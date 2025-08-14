import 'package:core/base_modules/errors_handling/core_of_module/core_utils/specific_for_bloc/consumable.dart';
import 'package:core/base_modules/errors_handling/core_of_module/failure_ui_entity.dart';
import 'package:core/base_modules/overlays/core/_context_x_for_overlays.dart';
import 'package:flutter/material.dart' show BuildContext;

/// 📦 Extension to wrap any object in a [Consumable]
//
extension ConsumableX<T> on T {
  ///--------------------------
  //
  Consumable<T> asConsumable() => Consumable(this);
}

////
////

/// 📦 Extension to one-time error show
//
extension FailureUIContextX on BuildContext {
  ///---------------------------------------
  //
  void consumeAndShowDialog(FailureUIEntity? uiFailure) {
    if (uiFailure != null) showError(uiFailure);
  }
}
