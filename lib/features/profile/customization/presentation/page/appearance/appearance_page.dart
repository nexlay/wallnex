import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/on_page_list_tile.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/language_provider.dart';
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
    return Card(
      child: OnPageListTile(
        enabled: false,
        isThreeLine: true,
        title: Text(
          locale.theme,
          textAlign: TextAlign.start,
        ),
        subtitle: Column(
          children: [
            Text(
              locale.themeDesc,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: kHeightForSpacer,
            ),
            Consumer<ThemeProvider>(
              builder: (_, themeProvider, __) {
                return ToggleButtons(
                  borderRadius: BorderRadius.circular(kAppSize),
                  isSelected: [
                    themeProvider.value == ThemeValue.auto,
                    themeProvider.value == ThemeValue.light,
                    themeProvider.value == ThemeValue.dark,
                  ],
                  onPressed: (index) {
                    themeProvider.setThemeValue(index);
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(locale.auto),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(locale.light),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(locale.dark),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Extracted language card widget for better organization
  Widget _buildLanguageCard(BuildContext context, L locale) {
    return Card(
      child: OnPageListTile(
        title: Text(
          locale.language,
          textAlign: TextAlign.start,
        ),
        enabled: false, // Consider if this should be interactive
        subtitle: Column(
          children: [
            Text(
              locale.languageDesc,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: kHeightForSpacer,
            ),
            Consumer<LanguageProvider>(
              builder: (_, languageProvider, __) {
                return ToggleButtons(
                  borderRadius: BorderRadius.circular(kAppSize),
                  isSelected: [
                    languageProvider.value.languageCode ==
                        AppLanguage.english.value,
                    languageProvider.value.languageCode ==
                        AppLanguage.polish.value,
                    languageProvider.value.languageCode ==
                        AppLanguage.ukraine.value,
                  ],
                  onPressed: (index) {
                    languageProvider.setLanguageValue(
                      AppLanguage.values[index].value,
                    );
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(locale.en),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(locale.pl),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(locale.uk),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
