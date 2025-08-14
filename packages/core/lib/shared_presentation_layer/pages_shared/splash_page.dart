import 'package:core/shared_presentation_layer/shared_widgets/loader.dart';
import 'package:flutter/material.dart';

/// ⏳ [SplashPage] — Displays a loading indicator
//
final class SplashPage extends StatelessWidget {
  ///-----------------------------------------
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AppLoader());
  }
}
