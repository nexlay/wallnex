import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/presentation/pages/image_preview_page/widgets/set_wallpaper_menu.dart';
import '../../provider/get_favorites_wallpapers_notifier.dart';
import '../../provider/get_theme_notifier.dart';
import '../../provider/get_wallpapers_from_api_notifier.dart';
import '../image_detail_and_suggestions_page/widgets/image_specs/image_specs_menu.dart';
import '../image_detail_and_suggestions_page/widgets/set_wallpaper_menu/set_wallpaper_menu.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = context.select((GetFavoritesNotifier f) => f.isFavorite);
    final wallpaperUploader =
        context.select((GetWallpapersNotifier w) => w.wallpaperWithTags);
    TransformationController controller = TransformationController();
   controller.value = Matrix4(0.538154027042916, 0.0, 0.0, 0.0, 0.0, 0.538154027042916, 0.0, 0.0, 0.0, 0.0, 0.538154027042916, 0.0, -292.01257211464167, -2.013728073180232e-10, 0.0, 1.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Hero(
              tag: wallpaper.id,
              child: AspectRatio(
                aspectRatio: 9 / 16,
                child: Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: InteractiveViewer(
                      transformationController: controller,
                      onInteractionStart: (details) {

                      },
                      onInteractionEnd: (ScaleEndDetails endDetails) {},
                      minScale: 0.1,
                      constrained: false,
                      alignPanAxis: true,
                      child: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1.0,
                            value: progress.progress,
                          ),
                        ),
                        imageUrl: wallpaper.path,

                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ButtonBar(
            children: [
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
                ),
              ),
              IconButton(
                onPressed: () {
                  showBottomMenu(context, '',
                      ImageSpecsDialog(wallpaper: wallpaperUploader));
                  context.read<GetThemeNotifier>().checkThemeMode();
                },
                icon: const Icon(
                  Icons.info_outline,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.crop_free,
                ),
              ),
              IconButton(
                onPressed: () {
                  showBottomMenu(
                    context,
                    wallpaper.path,
                    SetWallpaperMenu(
                      path: wallpaper.path,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.check_circle_outline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
