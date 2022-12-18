import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/common/animations/loading.dart';
import 'package:wallnex/presentation/common/animations/no_suggestions.dart';
import 'package:wallnex/presentation/pages/image_detail_and_suggestions_page/widgets/suggestions/suggestions_builder.dart';

import 'package:wallnex/presentation/provider/get_suggestions_notifier.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _showBody(context);
  }

  Widget _showBody(BuildContext context) {
    final isLoading = context.select((GetSuggestionsNotifier l) => l.isLoading);
    final suggestions =
        context.select((GetSuggestionsNotifier s) => s.suggestions);

    if (isLoading) {
      return const Center(child: Loader());
    } else if (!isLoading && suggestions.isEmpty) {
      return const Center(child: EmptySuggestions());
    } else if (!isLoading && suggestions.isNotEmpty) {
      return SuggestionsBuilder(suggestions: suggestions);
    } else {
      return const Loader();
    }
  }
}
