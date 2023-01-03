import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/presentation/provider/get_images_notifier.dart';

class ImageSearch extends SearchDelegate<List<Wallpaper>> {
  ImageSearch({
    super.searchFieldLabel = 'Search images',
    super.searchFieldStyle = const TextStyle(fontSize: 16.0),
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, []),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final list = context.select((GetImagesNotifier n) => n.imageList);
    return ListTile(
      leading: const Icon(Icons.search),
      title: Text(query),
      onTap: () {
        context.read<GetImagesNotifier>().search(query);
        close(context, list);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = context.select((GetImagesNotifier n) => n.imageList);
    return ListView.builder(
      itemCount: categoriesList.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(categoriesList[index]),
        onTap: () {
          query = categoriesList[index];
          context.read<GetImagesNotifier>().search(query);
          close(context, list);
        },
      ),
    );
  }
}
