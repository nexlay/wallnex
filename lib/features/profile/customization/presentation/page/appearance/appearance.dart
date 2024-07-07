import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/language_provider.dart';
import 'package:wallnex/features/profile/profile_list_tile.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../provider/theme_provider.dart';

class Appearance extends StatefulWidget {
  const Appearance({super.key});

  @override
  State<Appearance> createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {
  ThemeValue themeValue = ThemeValue.auto;

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
              ProfileListTile(
                title: Text(
                  locale.theme,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: kFontSize),
                ),
                isCenter: false,
                enabled: false,
                subtitle: Text(
                  locale.themeDesc,
                  textAlign: TextAlign.justify,
                ),
              ),
              Consumer<ThemeProvider>(
                builder: (_, themeProvider, __) {
                  themeValue = themeProvider.value;
                  //Check on theme changed

                  return SegmentedButton<int>(
                    segments: <ButtonSegment<int>>[
                      ButtonSegment<int>(
                        value: ThemeValue.auto.value,
                        icon: const Icon(Icons.auto_awesome_outlined),
                        label: Text(locale.auto),
                      ),
                      ButtonSegment<int>(
                        icon: const Icon(Icons.light_mode_outlined),
                        value: ThemeValue.light.value,
                        label: Text(locale.light),
                      ),
                      ButtonSegment<int>(
                        icon: const Icon(Icons.dark_mode_outlined),
                        value: ThemeValue.dark.value,
                        label: Text(locale.dark),
                      ),
                    ],
                    selected: <int>{themeProvider.value.value},
                    onSelectionChanged: (Set<int> newSelection) {
                      themeProvider.setThemeValue(newSelection.first);
                    },
                  );
                },
              ),
              ProfileListTile(
                title: Text(
                  locale.language,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: kFontSize),
                ),
                isCenter: false,
                enabled: false,
                subtitle: Text(
                  locale.languageDesc,
                  textAlign: TextAlign.justify,
                ),
              ),
              Consumer<LanguageProvider>(
                builder: (_, languageProvider, __) {
                  return SegmentedButton<Locale>(
                    segments: <ButtonSegment<Locale>>[
                      ButtonSegment<Locale>(
                        value: Locale(AppLanguage.english.value),
                        // icon: const Icon(Icons.auto_awesome_outlined),
                        label: Text(locale.en),
                      ),
                      ButtonSegment<Locale>(
                        // icon: const Icon(Icons.light_mode_outlined),
                        value: Locale(AppLanguage.polish.value),
                        label: Text(locale.pl),
                      ),
                      ButtonSegment<Locale>(
                        // icon: const Icon(Icons.dark_mode_outlined),
                        value: Locale(AppLanguage.ukraine.value),
                        label: Text(locale.uk),
                      ),
                    ],
                    selected: <Locale>{languageProvider.value},
                    onSelectionChanged: (Set<Locale> newSelection) {
                      languageProvider
                          .setLanguageValue(newSelection.first.languageCode);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
