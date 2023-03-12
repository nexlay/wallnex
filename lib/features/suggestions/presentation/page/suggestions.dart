import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/suggestions/presentation/page/suggestions_page.dart';
import '../../../../common/ui/animations/empty_sliver_screen.dart';
import '../../../../const/const_rive.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../provider/get_suggestions_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final suggestions = context
        .select((GetSuggestionsNotifier provider) => provider.suggestions);
    final isLoading =
        context.select((GetSuggestionsNotifier provider) => provider.isLoading);
    return _showBody(
      context,
      suggestions,
      isLoading,
    );
  }

  Widget _showBody(
    BuildContext context,
    List<Wallpaper> suggestions,
    bool isLoading,
  ) {

    final locale = AppLocalizations.of(context)!;
    final emptyScreen = EmptyScreen(
      assetPath: emptySuggestions,
      title: locale.suggestionsNotFound,
      subtitle: locale.tryToReloadSuggestions,
    );

    return isLoading
        ? emptyScreen
        : !isLoading && suggestions.isEmpty
            ? emptyScreen
            : !isLoading && suggestions.isNotEmpty
                ? const SuggestionsPage()
                : emptyScreen;
  }
}
