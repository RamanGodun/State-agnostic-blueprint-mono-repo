/*
 * 📜 License
 * This package is licensed under the same terms as the monorepo’s root
 * [LICENSE](../../../LICENSE).
 */

import 'package:app_bootstrap/bootstrap.dart' show bootstrap;
import 'package:app_on_bloc/app.dart' show App;

/// 🏁 Application entry point
//
void main() {
  bootstrap(() => const App());
}
