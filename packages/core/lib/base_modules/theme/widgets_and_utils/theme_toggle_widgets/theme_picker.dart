import 'package:core/base_modules/localization/core_of_module/init_localization.dart';
import 'package:core/base_modules/localization/generated/locale_keys.g.dart';
import 'package:core/base_modules/localization/module_widgets/text_widget.dart';
import 'package:core/base_modules/overlays/core/_context_x_for_overlays.dart';
import 'package:core/base_modules/theme/module_core/theme_variants.dart';
import 'package:core/base_modules/theme/theme_providers_or_cubits/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 🌗 [ThemePicker] — Allows to pick the theme mode and shows overlay notification
/// Use this widget in both Riverpod or Cubit/BLoC apps by toggling the relevant section.
/// Only one block (Riverpod or Cubit) should be uncommented at a time.
///
final class ThemePicker extends ConsumerWidget {
  ///--------------------------------------
  const ThemePicker({super.key});
  //

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    /// 🟢 RIVERPOD — Uncomment for apps using Riverpod
    final themeConfig = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);

    /// 🔴 RIVERPOD — Uncomment for apps using Cubit/BLoC
    /*
      final themeConfig = context.watch<AppThemeCubit>().state;
      final themeNotifier = context.read<AppThemeCubit>();
    */

    final locale = Localizations.localeOf(context);

    return DropdownButton<ThemeVariantsEnum>(
      key: ValueKey(locale.languageCode),
      value: themeConfig.theme,
      icon: const Icon(Icons.arrow_drop_down),
      underline: const SizedBox(),

      /// 🔄 When user picks a theme
      onChanged: (ThemeVariantsEnum? selected) {
        if (selected == null) return;

        // 🟢 Apply selected theme
        themeNotifier.setTheme(selected);

        // 🏷️ Fetch localized label
        final label = _chosenThemeLabel(context, selected);

        // 🌟 Show overlay banner with confirmation
        context.showUserBanner(message: label, icon: Icons.palette);
      },

      // 🧾 Theme options list
      items:
          [
                ThemeVariantsEnum.light,
                ThemeVariantsEnum.dark,
                ThemeVariantsEnum.amoled,
              ]
              .map(
                (type) => DropdownMenuItem<ThemeVariantsEnum>(
                  value: type,
                  child: TextWidget(
                    _themeLabel(context, type),
                    TextType.titleMedium,
                  ),
                ),
              )
              .toList(),
    );
  }

  ////
  ////

  /// 🏷️ Returns localized label for theme in dropdown
  String _themeLabel(BuildContext context, ThemeVariantsEnum type) {
    switch (type) {
      case ThemeVariantsEnum.light:
        return AppLocalizer.translateSafely(LocaleKeys.theme_light);
      case ThemeVariantsEnum.dark:
        return AppLocalizer.translateSafely(LocaleKeys.theme_dark);
      case ThemeVariantsEnum.amoled:
        return AppLocalizer.translateSafely(LocaleKeys.theme_amoled);
    }
  }

  /// 🏷️ Returns localized label for confirmation banner
  String _chosenThemeLabel(BuildContext context, ThemeVariantsEnum type) {
    switch (type) {
      case ThemeVariantsEnum.light:
        return AppLocalizer.translateSafely(LocaleKeys.theme_light_enabled);
      case ThemeVariantsEnum.dark:
        return AppLocalizer.translateSafely(LocaleKeys.theme_dark_enabled);
      case ThemeVariantsEnum.amoled:
        return AppLocalizer.translateSafely(LocaleKeys.theme_amoled_enabled);
    }
  }

  //
}
