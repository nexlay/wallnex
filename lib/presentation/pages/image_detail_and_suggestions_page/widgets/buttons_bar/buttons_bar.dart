import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/pages/image_preview_page/preview_page.dart';
import 'package:wallnex/presentation/provider/get_favorites_wallpapers_notifier.dart';
import '../../../../provider/get_wallpapers_from_api_notifier.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final wallpaper =
    context.select((GetWallpapersNotifier w) => w.wallpaperWithTags);
    bool isFavorite = context.select((GetFavoritesNotifier f) => f.isFavorite);
    return ButtonBar(
      children: [
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PreviewPage(
                   wallpaper: wallpaper,
                  ),
                ),
              );
            },
            child: const Text('Preview')),
        IconButton(
            onPressed: () {
              if (isFavorite) {
                context
                    .read<GetFavoritesNotifier>()
                    .deleteFromFavorites(wallpaper);
              } else {
                context
                    .read<GetFavoritesNotifier>()
                    .insertIntoFavorites(wallpaper);
              }
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.redAccent : null,
            )),
      ],
    );
  }
}
