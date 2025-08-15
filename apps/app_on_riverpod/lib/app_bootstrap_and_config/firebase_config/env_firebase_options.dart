import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// 🧩 [EnvFirebaseOptions] — platform-based FirebaseOptions generator
/// 📦 Firebase configuration based on current environment (.env + flutter_dotenv)
/// 🧼 Uses `flutter_dotenv` to securely read platform-specific values from `.env`
/// 🔧 Platforms supported:
///      - ✅ Android
///      - ✅ iOS
///      - ✅ Web
///      - ❌ macOS, Windows, Linux (throws [UnsupportedError])
//
final class EnvFirebaseOptions {
  ///------------------------

  /// 🧱 Returns [FirebaseOptions] for the current platform
  static FirebaseOptions get currentPlatform {
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => _android,
      TargetPlatform.iOS => _ios,
      TargetPlatform.macOS => throw UnsupportedError(
        '❌ macOS is not supported',
      ),
      TargetPlatform.windows => throw UnsupportedError(
        '❌ Windows is not supported',
      ),
      TargetPlatform.linux => throw UnsupportedError(
        '❌ Linux is not supported',
      ),
      _ when kIsWeb => _web,
      _ => throw UnsupportedError('❌ Unknown platform'),
    };
  }

  /// 🔐 Returns required .env value or throws
  static String _env(String key) {
    final value = dotenv.env[key];
    if (value == null || value.isEmpty) {
      throw ArgumentError('Missing `$key` in .env');
    }
    return value;
  }

  /// 🤖 Android Firebase config
  static FirebaseOptions get _android => FirebaseOptions(
    apiKey: _env('FIREBASE_API_KEY'),
    appId: _env('FIREBASE_APP_ID'),
    projectId: _env('FIREBASE_PROJECT_ID'),
    messagingSenderId: _env('FIREBASE_MESSAGING_SENDER_ID'),
    storageBucket: _env('FIREBASE_STORAGE_BUCKET'),
  );

  /// 🍏 iOS Firebase config
  static FirebaseOptions get _ios => FirebaseOptions(
    apiKey: _env('FIREBASE_API_KEY'),
    appId: _env('FIREBASE_APP_ID'),
    projectId: _env('FIREBASE_PROJECT_ID'),
    messagingSenderId: _env('FIREBASE_MESSAGING_SENDER_ID'),
    storageBucket: _env('FIREBASE_STORAGE_BUCKET'),
    iosBundleId: _env('FIREBASE_IOS_BUNDLE_ID'),
  );

  /// 🌍 Web config (read from .env)
  static FirebaseOptions get _web => FirebaseOptions(
    apiKey: _env('FIREBASE_API_KEY'),
    appId: _env('FIREBASE_APP_ID'),
    projectId: _env('FIREBASE_PROJECT_ID'),
    messagingSenderId: _env('FIREBASE_MESSAGING_SENDER_ID'),
    storageBucket: _env('FIREBASE_STORAGE_BUCKET'),
    authDomain: _env('FIREBASE_AUTH_DOMAIN'),
  );

  //
}
