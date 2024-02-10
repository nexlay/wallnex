import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../../common/ui/image/image_card.dart';
import '../../../../const/route_paths.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../../../images/presentation/provider/get_images_notifier.dart';
import '../../../suggestions/presentation/provider/get_suggestions_notifier.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key, required this.favorites});

  final List<Wallpaper> favorites;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: favorites.length,
        (context, index) {
          return AspectRatio(
            aspectRatio: 2 / 1,
            child: ImageCard(
              goTo: () {
                context
                    .read<GetImagesNotifier>()
                    .getImageById(favorites[index].id);
                context
                    .read<GetSuggestionsNotifier>()
                    .getSuggestions(favorites[index].id);
                context.push(krDetails, extra: favorites[index]);
              },
              path: favorites[index].thumbsLarge,
              wallpaper: favorites[index],
              showImageSpecsBtn: false,
              showFavoriteBtn: true,
              showSendBtn: false,
            ),
          );
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
    );
  }
}
