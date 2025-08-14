// 📌 No need for public API docs.
// ignore_for_file: public_member_api_docs

import 'package:core/base_modules/animations/module_core/_animation_engine.dart'
    show AnimationEngine;
import 'package:core/base_modules/overlays/core/enums_for_overlay_module.dart';
import 'package:core/base_modules/overlays/overlays_dispatcher/_overlay_dispatcher.dart'
    show OverlayDispatcher;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart' show Uuid;

part 'banner_overlay_entry.dart';
part 'dialog_overlay_entry.dart';
part 'snackbar_overlay_entry.dart';

/// 🧩 [OverlayUIEntry] — Abstract descriptor for a UI overlay entry
///   - Used in queue management and conflict resolution
///   - Holds config such as dismiss policy, priority, and platform-aware widget
///   - Each entry is uniquely identified by [id] (used to avoid duplicate insertion)
//
sealed class OverlayUIEntry {
  ///---------------------
  /// 🆔 Unique entry identifier (auto-generated via UUID if not provided)
  OverlayUIEntry({String? id}) : id = id ?? const Uuid().v4();
  //
  final String id;

  /// 🎛️ Conflict resolution strategy: priority, replacement policy, category
  OverlayConflictStrategy get strategy;

  /// 🔓 Whether user can dismiss overlay via tap on background
  OverlayDismissPolicy? get dismissPolicy;

  /// ☁️ Whether overlay allows taps to pass through background
  bool get tapPassthroughEnabled => false;

  /// 🧱 Builds the overlay widget (platform-specific with animation engine inside)
  Widget buildWidget();

  /// 🧼 Called when overlay is auto-dismissed (e.g. timeout)
  void onAutoDismissed() {}

  //
}

////

////

/// 🧠 [OverlayConflictStrategy] — Strategy object for each overlay that
/// defines its replacement logic and category identification.
/// used to determine behavior when multiple overlays are triggered.
//
final class OverlayConflictStrategy {
  const OverlayConflictStrategy({
    required this.priority,
    required this.policy,
    required this.category,
  });

  ///-----------------------
  //
  final OverlayPriority priority;
  final OverlayReplacePolicy policy;
  final OverlayCategory category;

  //
}
