import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import 'package:wallnex/features/search/presentation/provider/get_search_history_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ImageSearch extends SearchDelegate<List<Wallpaper>> {
  set searchFieldLabel(String? field) => super.searchFieldLabel;

  @override
  List<Widget>? buildActions(BuildContext context) {
    searchFieldLabel = AppLocalizations.of(context)!.searchImages;
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
    final list = context.select((GetImagesNotifier n) => n.imageList);
    Future.delayed(Duration.zero, () async {
      context.read<GetSearchHistoryNotifier>().pushSearchHistory(query);
      context.read<GetImagesNotifier>().searchByQuery(query);
      close(context, list);
    });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = context.select((GetImagesNotifier n) => n.imageList);
    final searchHistory =
        context.select((GetSearchHistoryNotifier s) => s.searchHistory);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Center(
        child: searchHistory.isEmpty ? Text(AppLocalizations.of(context)!.noSearchHistory) : Card(
          color: Colors.transparent,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 0.1,
                height: 2.0,
                color: Colors.transparent,
              );
            },
            itemCount: searchHistory.length,
            itemBuilder: (_, index) => ListTile(
              tileColor: Theme.of(context).colorScheme.background,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.north_west,
                  size: 18.0,
                ),
                onPressed: () {
                  query =
                      searchHistory[index];
                },
              ),
              leading: const Icon(Icons.history),
              title: Text(searchHistory[index]),
              onTap: () {
                query =
                    searchHistory[index];
                context
                    .read<GetSearchHistoryNotifier>()
                    .pushSearchHistory(query);
                context.read<GetImagesNotifier>().searchByQuery(query);
                close(context, list);
              },
            ),
          ),
        ),
      ),
    );
  }
}
