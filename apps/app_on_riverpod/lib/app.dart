import 'package:flutter/material.dart';

/// 🏠 Root widget of the application. Provides global theme configuration and
/// serves as the main entry point for rendering the widget tree.
//
final class App extends StatelessWidget {
  ///---------------------------------
  /// Creates the root [App] widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// 🎨 Enables Material 3 theming across the app.
      theme: ThemeData(useMaterial3: true),

      /// 🖼 Initial screen placeholder.
      home: const Scaffold(
        body: Center(
          child: Text('Placeholder'),
        ),
      ),
    );
  }
}
