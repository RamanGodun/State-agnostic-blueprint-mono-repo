import 'package:core/base_modules/errors_handling/core_of_module/either.dart';
import 'package:core/base_modules/errors_handling/core_of_module/failure_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 🧩 [ResultFuture] — Represents async result with [Either<Failure, T>]
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// 🧩 [FailureOr<T>] — Sync `Either<Failure, T>`
typedef FailureOr<T> = Either<Failure, T>;

/// 🧩 [VoidResult] — `ResultFuture<void>`, for void  action
typedef VoidResult = ResultFuture<void>;

/// 🔁 [VoidEither] — Sync `Either<Failure, void>`
typedef VoidEither = Either<Failure, void>;

/// 📦 [DataMap] — For JSON-style dynamic map (used for DTO, serialization, Firestore docs...)
typedef DataMap = Map<String, dynamic>;

/// 🧾 [FieldUiState] — Compact record for field visibility & error display
typedef FieldUiState = ({String? errorText, bool isObscure});

/// 📤 [SubmitCallback] — Button or form submission callback
typedef SubmitCallback = void Function(BuildContext context);

/// 📡 [ListenFailureCallback] — Optional handler when failure is caught
typedef ListenFailureCallback = void Function(Failure failure);

/// 🔧 [RefAction] — Executes an action without returning value, using Riverpod context
typedef RefAction = void Function();

/// 🔧 [RefCallback] — Provides [WidgetRef] for scoped logic or widget actions
typedef RefCallback = void Function(WidgetRef ref);
