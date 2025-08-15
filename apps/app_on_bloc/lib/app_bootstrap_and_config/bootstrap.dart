import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// VGV-style bootstrap adapter that delegates to your AppBootstrap.
//
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  //
  /// Capture framework errors.
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  /// Capture uncaught async errors.
  PlatformDispatcher.instance.onError = (error, stack) {
    log('Uncaught (platform): $error', stackTrace: stack);
    return true;
  };

  ///
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Run initialization pipeline
      // const appBootstrap = AppBootstrap();
      // await appBootstrap.initAllServices();

      runApp(await builder());
    },

    (error, stack) {
      log('Uncaught (zoned): $error', stackTrace: stack);
    },
    //
  );

  //
}
