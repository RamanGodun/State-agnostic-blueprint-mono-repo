import 'package:core/_should_be_removed_later/user_auth_provider/firebase_auth_providers.dart'
    show authStateStreamProvider;
import 'package:core/base_modules/navigation/module_core/routes_redirection_service.dart';
import 'package:core/base_modules/navigation/routes/app_routes.dart';
import 'package:core/base_modules/overlays/utils/overlays_cleaner_within_navigation.dart';
import 'package:core/shared_presentation_layer/pages_shared/page_not_found.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'go_router_factory.dart';

/// 🧩 [routerProvider] — Public-facing provider used in the widget tree.
/// ✅ Supports `.select(...)` for optimized rebuilds.
/// 💡 Always use `ref.watch(routerProvider)` in the UI layer instead of `goRouter`.
//
final routerProvider = Provider<GoRouter>((ref) => ref.watch(goRouter));

////
////

/// 🧭 [goRouter] — Low-level DI token for GoRouter instance.
/// ✅ Overridden in the global DI container with `buildGoRouter(...)`.
/// 🚫 Should not be used directly in the widget tree.
//
final goRouter = Provider<GoRouter>((_) => throw UnimplementedError());
