/*
 * 📜 License
 * This package is licensed under the same terms as the monorepo’s root
 * [LICENSE](../../../LICENSE).
 */

import 'package:app_on_bloc/app.dart' show App;
import 'package:app_on_bloc/app_bootstrap_and_config/bootstrap.dart'
    show bootstrap;

/// 🏁 Application entry point
//
void main() {
  bootstrap(() => const App());
}
