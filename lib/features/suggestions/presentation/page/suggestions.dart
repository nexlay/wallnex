import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/animations/empty_screen.dart';
import 'package:wallnex/features/suggestions/presentation/page/suggestions_page.dart';
import '../../../../../common/ui/animations/loading.dart';
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
    return Selector<GetSuggestionsNotifier,
        Tuple3<List<Wallpaper>, bool, String>>(
      selector: (_, provider) =>
          Tuple3(provider.suggestions, provider.isLoading, provider.error),
      builder: (_, value, __) =>
          _showBody(context, value.value1, value.value2, value.value3),
    );
  }

  Widget _showBody(BuildContext context, List<Wallpaper> suggestions,
      bool isLoading, String error) {
    if (isLoading) {
      return const Center(child: Loader());
    } else if (!isLoading && suggestions.isEmpty) {
      return Center(
        child: EmptyScreen(
          animations: const ['lens', 'animate'],
          assetPath: emptySuggestions,
          title: AppLocalizations.of(context)!.noSuggestions,
          subtitle: AppLocalizations.of(context)!.noSuggestionsDesc,
        ),
      );
    } else if (!isLoading && suggestions.isNotEmpty) {
      return const SuggestionsPage();
    } else {
      return const Loader();
    }
  }
}
