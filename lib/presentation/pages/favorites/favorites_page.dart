import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/ui/image/image_card.dart';
import '../../provider/get_favorites_images_notifier.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 4 / 6,
        child: Consumer<GetFavoritesNotifier>(
          builder: (_, provider, __) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: provider.favorites.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: ImageCard(
                  wallpaper: provider.favorites[index],
                  url: provider.favorites[index].path,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
