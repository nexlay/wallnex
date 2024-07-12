import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/language_provider.dart';
import 'package:wallnex/features/profile/profile_list_tile.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../provider/theme_provider.dart';

class AppearanceScreen extends StatelessWidget {
  // Renamed for clarity
  const AppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);

    return Scaffold(
      body: BodyScrollView(
        title: locale.appearance,
        childWidget: SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              _buildThemeCard(context, locale),
              _buildLanguageCard(context, locale),
            ],
          ),
        ),
      ),
    );
  }

  // Extracted theme card widget for better organization
  Widget _buildThemeCard(BuildContext context, L locale) {
    return ProfileListTile(
      elevation: 0.1,
      isThreeLine: true,
      title: Text(
        locale.theme,
        textAlign: TextAlign.start,
        style:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: kFontSize),
      ),
      subtitle: Column(
        children: [
          Text(
            locale.themeDesc,
            textAlign: TextAlign.justify,
          ),
          Consumer<ThemeProvider>(
            builder: (_, themeProvider, __) {
              return SegmentedButton<ThemeValue>(
                // Use ThemeValue enum directly
                segments: <ButtonSegment<ThemeValue>>[
                  ButtonSegment<ThemeValue>(
                    value: ThemeValue.auto,
                    icon: const Icon(Icons.auto_awesome_outlined),
                    label: Text(locale.auto), // Use locale here for consistency
                  ),
                  ButtonSegment<ThemeValue>(
                    icon: const Icon(Icons.light_mode_outlined),
                    value: ThemeValue.light,
                    label:
                        Text(locale.light), // Use locale here for consistency
                  ),
                  ButtonSegment<ThemeValue>(
                    icon: const Icon(Icons.dark_mode_outlined),
                    value: ThemeValue.dark,
                    label: Text(locale.dark), // Use locale here for consistency
                  ),
                ],
                selected: {themeProvider.value},
                onSelectionChanged: (Set<ThemeValue> newSelection) {
                  themeProvider.setThemeValue(newSelection.first.index);
                },
              );
            },
          ),
        ],
      ),
      isCenter: false,
    );
  }

  // Extracted language card widget for better organization
  Widget _buildLanguageCard(BuildContext context, L locale) {
    return ProfileListTile(
      title: Text(
        locale.language,
        textAlign: TextAlign.start,
        style:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: kFontSize),
      ),
      isCenter: false,
      enabled: false, // Consider if this should be interactive
      subtitle: Column(
        children: [
          Text(
            locale.languageDesc,
            textAlign: TextAlign.justify,
          ),
          Consumer<LanguageProvider>(
            builder: (_, languageProvider, __) {
              return SegmentedButton<Locale>(
                segments: <ButtonSegment<Locale>>[
                  ButtonSegment<Locale>(
                    value: Locale(AppLanguage.english.value),
                    label: Text(locale.en),
                  ),
                  ButtonSegment<Locale>(
                    value: Locale(AppLanguage.polish.value),
                    label: Text(locale.pl),
                  ),
                  ButtonSegment<Locale>(
                    value: Locale(AppLanguage.ukraine.value),
                    label: Text(locale.uk),
                  ),
                ],
                selected: {languageProvider.value},
                onSelectionChanged: (Set<Locale> newSelection) {
                  languageProvider
                      .setLanguageValue(newSelection.first.languageCode);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
