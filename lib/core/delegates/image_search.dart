import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import 'package:wallnex/features/search/presentation/provider/get_search_history_notifier.dart';
import '../config/l10n/generated/app_localizations.dart';

class ImageSearch extends SearchDelegate<List<Wallpaper>> {
  set searchFieldLabel(String? field) => super.searchFieldLabel;

  final translator = GoogleTranslator();

  @override
  List<Widget>? buildActions(BuildContext context) {
    searchFieldLabel = L.of(context).searchImages;
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          size: 18.0,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, []),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Initiate search through the notifier, passing both original and translated queries
    context.read<GetImagesNotifier>().searchByQuery(query);
    context.read<GetSearchHistoryNotifier>().pushSearchHistory(query);
    close(context, []);
    // Return a loading indicator
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchHistory =
        context.select((GetSearchHistoryNotifier s) => s.searchHistory);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Center(
        child: searchHistory.isEmpty
            ? Text(L.of(context).noSearchHistory)
            : _buildSearchHistoryCard(context, searchHistory),
      ),
    );
  }

  Widget _buildSearchHistoryCard(
      BuildContext context, List<String> searchHistory) {
    return Card(
      color: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: searchHistory.length,
        itemBuilder: (_, index) => _SearchHistoryTile(
          query: searchHistory[index],
          onTap: () {
            query = searchHistory[index];
            context.read<GetSearchHistoryNotifier>().pushSearchHistory(query);
            context.read<GetImagesNotifier>().searchByQuery(query);
            close(context, []); // Close after initiating search
          },
        ),
      ),
    );
  }
}

// Extracted Search History Tile Widget
class _SearchHistoryTile extends StatelessWidget {
  final String query;
  final VoidCallback onTap;

  const _SearchHistoryTile({
    required this.query,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.north_west,
          size: 18.0,
        ),
        onPressed: () {
          // Update the search query without triggering a new search
          context.read<ImageSearch>().query = query;
        },
      ),
      leading: const Icon(Icons.history),
      title: Text(query),
      onTap: onTap,
    );
  }
}
