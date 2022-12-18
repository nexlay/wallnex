import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/pages/image_preview_page/preview_page.dart';
import '../../../features/images/domain/entities/wallpaper.dart';
import '../../pages/image_detail_and_suggestions_page/image_detail_page.dart';
import '../../provider/get_favorites_wallpapers_notifier.dart';
import '../../provider/get_navBar_page_notifier.dart';
import '../../provider/get_suggestions_notifier.dart';
import '../../provider/get_wallpapers_from_api_notifier.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.wallpaper,
    required this.routing,
  }) : super(key: key);
  final Wallpaper wallpaper;
  final String routing;

  @override
  Widget build(BuildContext context) {
    final pageIndex = context.select((GetPages i) => i.getIndex);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          context
              .read<GetWallpapersNotifier>()
              .getTagsAndUploader(wallpaper.id);

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => routing == 'image_detail'
                  ? ImageDetail(wallpaper: wallpaper)
                  : PreviewPage(
                      wallpaper: wallpaper,
                    ),
            ),
          );

          context.read<GetFavoritesNotifier>().checkFavorites(wallpaper);

          context
              .read<GetSuggestionsNotifier>()
              .getSuggestions(wallpaper.id, wallpaper.colors[0]);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
            fadeInDuration: const Duration(seconds: 1),
            errorWidget: (_, url, error) => const Icon(
              Icons.broken_image,
              size: 50.0,
            ),
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
                value: progress.progress,
              ),
            ),
            imageUrl: pageIndex == 1 ? wallpaper.path : wallpaper.thumbsLarge,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
