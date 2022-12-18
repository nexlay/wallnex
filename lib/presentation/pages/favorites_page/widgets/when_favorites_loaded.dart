import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/common/image/image_card.dart';
import '../../../provider/get_favorites_wallpapers_notifier.dart';

class WhenFavoritesLoaded extends StatelessWidget {
  const WhenFavoritesLoaded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorites = context.select((GetFavoritesNotifier n) => n.favorites);
    final size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 1.5;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: itemHeight,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: favorites.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: ImageCard(
                  wallpaper: favorites[index],
                  routing: 'favorites',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
