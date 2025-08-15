import 'package:flutter/foundation.dart' show debugPrint;
import 'package:get_storage/get_storage.dart' show GetStorage;

/// 💾 [ILocalStorage] — Abstraction to decouple startup logic and enable mocking in tests.
//
// ignore: one_member_abstracts because must be flexibility of local storages
abstract interface class ILocalStorage {
  ///--------------------------------
  //
  /// Initializes all local storage services
  Future<void> init();
  //
}

////

////

/// 🧩📦 [LocalStorage] — Current implementation of [ILocalStorage] with initialization logic.
//
final class LocalStorage implements ILocalStorage {
  ///----------------------------------------------------
  const LocalStorage();
  //
  /// Initializes GetStorage (local key-value storage).
  @override
  Future<void> init() async {
    await GetStorage.init();
    debugPrint('💾 GetStorage initialized!');
  }

  /// Initialize other storages (e.g., SharedPreferences, Isar, SecureStorage) here, if needed.
  //

  //
}
