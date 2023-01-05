import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/presentation/provider/get_images_notifier.dart';

class ImageSearch extends SearchDelegate<List<Wallpaper>> {
  @override
  List<Widget>? buildActions(BuildContext context) {
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
      context.read<GetImagesNotifier>().search(query);
      close(context, list);
    });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = context.select((GetImagesNotifier n) => n.imageList);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Center(
        child: Card(
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
            itemCount: 9,
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
                  query = categoriesList[index];
                },
              ),
              leading: const Icon(Icons.history),
              title: Text(categoriesList[index]),
              onTap: () {
                context.read<GetImagesNotifier>().search(categoriesList[index]);
                close(context, list);
              },
            ),
          ),
        ),
      ),
    );
  }
}
