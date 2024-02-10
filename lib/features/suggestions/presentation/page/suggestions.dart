import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/suggestions/presentation/page/suggestions_page.dart';
import '../../../../common/ui/epty_screen/empty_screen.dart';
import '../../../../common/ui/loading_status/progess_indicator.dart';
import '../../../../const/const_rive.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../provider/get_suggestions_notifier.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({
    super.key,
  });

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
    final locale = L.of(context);
    final emptyScreen = EmptyScreen(
      assetPath: kEmptySuggestions,
      title: locale.suggestionsNotFound,
      subtitle: locale.tryToReloadSuggestions,
    );

    return isLoading
        ? const ProgressLoader()
        : !isLoading && suggestions.isEmpty
            ? emptyScreen
            : !isLoading && suggestions.isNotEmpty
                ? const SuggestionsPage()
                : emptyScreen;
  }
}
