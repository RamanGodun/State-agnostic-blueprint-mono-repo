import 'package:flutter/material.dart';

/// 🛠️ [OverlayUtils] — utility class for overlay-related helpers
/// ✅ Dismisses current overlay before executing the given action
///
abstract final class OverlayUtils {
  ///---------------------------
  OverlayUtils._();

  /// 🔁 Dismisses the currently visible overlay (if any) and executes [action]
  static VoidCallback dismissAndRun(VoidCallback action, BuildContext context) {
    return () {
      // final dispatcher = context.readDI(overlayDispatcherProvider);
      // dispatcher.dismissCurrent(force: true);
      //
      action.call();
    };
  }

  //
}
