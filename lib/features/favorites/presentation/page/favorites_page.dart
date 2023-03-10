import 'package:flutter/material.dart';
import '../../../../../common/ui/image/image_card.dart';
import '../../../../common/ui/buttons/favorite_button.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../../../images/presentation/page/details/widgets/image_specs/image_specs_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key, required this.favorites}) : super(key: key);

  final List<Wallpaper> favorites;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 4 / 6,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: favorites.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: ImageCard(
                wallpaper: favorites[index],
                url: favorites[index].path,
                imageSpecs: Positioned(
                  left: 5.0,
                  top: 5.0,
                  child: Card(
                    child: PopupMenuButton<Widget?>(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      constraints: const BoxConstraints.tightFor(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      icon: const Icon(Icons.more_horiz),
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem<Widget?>(
                          child: ImageSpecsBar(
                            size: favorites[index].size,
                            views: favorites[index].views,
                            resolution: favorites[index].resolution,
                            fontSize: 14.0,
                            iconSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                widget: Positioned(
                  right: 5.0,
                  bottom: 5.0,
                  child: Card(
                    child: FavoriteButton(
                      wallpaper: favorites[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
