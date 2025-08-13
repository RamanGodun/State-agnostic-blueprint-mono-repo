# Core

**Core** is the shared codebase for all apps in this monorepo.
It is organized by **modules** (navigation, localization, overlays, etc.) and
by **layers** (data / domain / presentation) to keep code modular, reusable, and easy to evolve.

---



## Installation

Add `core` to your app via a local path:

```yaml
# apps/<your_app>/pubspec.yaml
dependencies:
  core:
    path: ../../packages/core
```

Import only through the public barrel:

```dart
import 'package:core/core.dart';
```

> **Import rule:** In apps, never import internal files from modules directly — only the barrels.

---

## Public API & Structure

- `lib/core.dart` — the single public entry point.
- Each submodule exposes its own barrel and is re-exported from `core.dart`.

```
core/lib
├─ core_barrel.dart
└─ base_modules/
   ├─ animations/        ── animation_barrel.dart
   ├─ errors_handling/   ── errors_handling_barrel.dart
   ├─ form_fields/       ── form_fields_barrel.dart
   ├─ localization/      ── localization_barrel.dart
   ├─ logging/           ── (barrel when needed)
   ├─ navigation/        ── navigation_barrel.dart
   ├─ overlays/          ── overlays_barrel.dart
   └─ theme/             ── theme_barrel.dart

shared_data_layer/
shared_domain_layer/
shared_presentation_layer/
utils_shared/
```

---

## Modules (fill as you implement)

Each section below should include: purpose, public entry points, dependencies, and usage examples.

### Animations

> _TODO: purpose, engines, presets, examples._

### Error Handling

> _TODO: Failure types, Either helpers, loggers, UI mapping, examples._

### Form Fields

> _TODO: validators, input widgets, submission helpers, examples._

### Localization

> _TODO: init, context helpers, toggles, strings helpers, examples._

### Navigation

> _TODO: GoRouter factory, redirects, context extensions, examples._

### Overlays

> _TODO: dispatcher, conflict policies, dialog/banner/snackbar presets, examples._

### Theme

> _TODO: theme variants, typography, colors, toggles, examples._

### Logging

> _TODO: observers (Bloc/Riverpod), format, routing/async logs, examples._

---

## Layers

- **shared_data_layer** — DTOs, mappers, contracts/adapters shared across features.
- **shared_domain_layer** — entities, value objects, shared domain interfaces/use cases.
- **shared_presentation_layer** — shared pages/widgets (e.g., `SplashPage`, `AppBar`, `Loader`).
- **utils_shared** — cross-cutting utilities/extensions that don’t fit a single layer (debouncer, context extensions, etc.).

> If something doesn’t clearly fit a layer, place it in `utils_shared` temporarily and plan a follow-up refactor.

---

## Conventions

- **Barrels for public API only.** Inside `core`, prefer relative imports; in apps, import barrels.
- **Module isolation.** Modules shouldn’t depend on each other’s internals; use shared layers for common pieces.
- **Naming.** Barrels are named `<module>.dart`. Public types and factories are documented.
- **Breaking changes.** Record in `CHANGELOG.md` (see template below).

---

## Development

This repository uses [Melos](https://melos.invertase.dev/) to manage all packages.

### Common tasks (from repo root)

```bash
# Format + analyze + test all packages
melos run check

# Only this package
melos exec --scope="core" -- dart format .
melos exec --scope="core" -- flutter analyze
melos exec --scope="core" -- flutter test --coverage --no-pub
```

(Optional) Generate an HTML coverage report with `lcov`:

```bash
# once: brew install lcov
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Adding a new module

1. Create a folder under `lib/base_modules/<module_name>/`.
2. Add `<module_name>.dart` exporting the module’s public surface.
3. Re-export the module barrel from `lib/core_barrel.dart`.
4. Document the module in this README (section above).

---

## Versioning & Changelog

We follow **SemVer**: `MAJOR.MINOR.PATCH`. Keep a `CHANGELOG.md` in the package root.

**Entry template:**

```md
## [0.1.0] — 2025-08-15

### Added

- <module>: short list of features.

### Changed

- ...

### Fixed

- ...
```

---

## License
This package is licensed under the same terms as the [root LICENSE](../../LICENSE) of this monorepo.


---

## Roadmap (optional)

- [ ] Consolidate essential helpers in `utils_shared`.
- [ ] Add integration examples for each module.
- [ ] Wire up unified coverage in CI if needed.



