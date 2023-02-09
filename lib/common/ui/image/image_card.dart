import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import '../../../../features/images/domain/entities/wallpaper.dart';
import '../../../../features/images/presentation/page/details/image_details_page.dart';
import '../../../features/favorites/presentation/provider/favorites_images_notifier.dart';
import '../../../features/suggestions/presentation/provider/get_suggestions_notifier.dart';
import 'network_image_viewer.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.wallpaper,
    required this.url,
  }) : super(key: key);
  final Wallpaper wallpaper;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: () {
           context.push(details, extra: wallpaper);
          context.read<GetFavoritesNotifier>().checkFavorites(wallpaper);
          context
              .read<GetSuggestionsNotifier>()
              .getSuggestions(wallpaper.id);
        },
        child: NetworkImageViewer(
          url: url,
        ),
      ),
    );
  }
}
