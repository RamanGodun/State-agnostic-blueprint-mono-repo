import 'package:core/_should_be_removed_later/pages/change_password_page.dart'
    show ChangePasswordPage;
import 'package:core/_should_be_removed_later/pages/profile_page.dart'
    show ProfilePage;
import 'package:core/_should_be_removed_later/pages/reset_passwor_page.dart'
    show ResetPasswordPage;
import 'package:core/_should_be_removed_later/pages/sign_in_page.dart'
    show SignInPage;
import 'package:core/_should_be_removed_later/pages/sign_up_page.dart'
    show SignUpPage;
import 'package:core/_should_be_removed_later/pages/verify_email_page.dart'
    show VerifyEmailPage;
import 'package:core/base_modules/navigation/module_core/provider_for_go_router.dart';
import 'package:core/base_modules/navigation/utils/page_transition.dart';
import 'package:core/shared_presentation_layer/pages_shared/home_page.dart';
import 'package:core/shared_presentation_layer/pages_shared/page_not_found.dart';
import 'package:core/shared_presentation_layer/pages_shared/splash_page.dart';
import 'package:go_router/go_router.dart';

part 'route_paths.dart';
part 'routes_names.dart';

/// 🧭 [AppRoutes] — Centralized list of all GoRouter routes
/// ✅ Used in [buildGoRouter] and matches [RoutesNames]
//
abstract final class AppRoutes {
  ///-------------------------
  AppRoutes._();

  ///
  static final List<GoRoute> all = [
    /// ⏳ Splash Page
    GoRoute(
      path: RoutesPaths.splash,
      name: RoutesNames.splash,
      pageBuilder: (_, _) => AppTransitions.fade(const SplashPage()),
    ),

    /// 🏠 Home Page
    GoRoute(
      path: RoutesPaths.home,
      name: RoutesNames.home,
      pageBuilder: (context, state) => AppTransitions.fade(const HomePage()),
      routes: [
        /// 👤 Profile Page (Nested under Home)
        GoRoute(
          path: RoutesNames.profile,
          name: RoutesNames.profile,
          pageBuilder: (context, state) =>
              AppTransitions.fade(const ProfilePage()),
          routes: [
            /// 👤  Change password Page (Nested under Profile page)
            GoRoute(
              path: RoutesNames.changePassword,
              name: RoutesNames.changePassword,
              pageBuilder: (context, state) =>
                  AppTransitions.fade(const ChangePasswordPage()),
            ),
          ],
        ),
      ],
    ),

    /// 🔐 Auth Pages
    GoRoute(
      path: RoutesPaths.signIn,
      name: RoutesNames.signIn,
      pageBuilder: (context, state) => AppTransitions.fade(const SignInPage()),
    ),

    GoRoute(
      path: RoutesPaths.signUp,
      name: RoutesNames.signUp,
      pageBuilder: (context, state) => AppTransitions.fade(const SignUpPage()),
    ),

    GoRoute(
      path: RoutesPaths.resetPassword,
      name: RoutesNames.resetPassword,
      pageBuilder: (context, state) =>
          AppTransitions.fade(const ResetPasswordPage()),
    ),

    GoRoute(
      path: RoutesPaths.verifyEmail,
      name: RoutesNames.verifyEmail,
      pageBuilder: (context, state) =>
          AppTransitions.fade(const VerifyEmailPage()),
    ),

    ///

    /// ❌ Error / 404 Page
    GoRoute(
      path: RoutesPaths.pageNotFound,
      name: RoutesNames.pageNotFound,
      pageBuilder: (context, state) => AppTransitions.fade(
        const PageNotFound(errorMessage: 'Page not found'),
      ),
    ),

    //
  ];

  //
}
