import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/pages/suggestions/suggestions_page.dart';
import 'package:wallnex/presentation/provider/get_suggestions_notifier.dart';
import '../../../features/images/domain/entities/wallpaper.dart';
import '../../common/ui/animations/loading.dart';
import '../../common/ui/animations/no_suggestions.dart';

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
      return const Center(child: EmptySuggestions());
    } else if (!isLoading && suggestions.isNotEmpty) {
      return const SuggestionsPage();
    } else {
      return const Loader();
    }
  }
}
