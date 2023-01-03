import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';

import '../../provider/get_favorites_images_notifier.dart';
class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key, required this.wallpaper}) : super(key: key);

  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = context.select((GetFavoritesNotifier f) => f.isFavorite);
    return IconButton(
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
      ),
    );
  }
}
