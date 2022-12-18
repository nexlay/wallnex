import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/pages/image_detail_and_suggestions_page/widgets/buttons_bar/buttons_bar.dart';
import 'package:wallnex/presentation/pages/image_detail_and_suggestions_page/widgets/image_specs/image_specs_bar.dart';
import 'package:wallnex/presentation/pages/image_detail_and_suggestions_page/widgets/image_specs/image_specs_menu.dart';
import 'package:wallnex/presentation/pages/image_detail_and_suggestions_page/widgets/set_wallpaper_menu/set_wallpaper_menu.dart';
import 'package:wallnex/presentation/pages/image_detail_and_suggestions_page/widgets/suggestions/suggestions.dart';
import '../../../features/images/domain/entities/wallpaper.dart';
import '../../provider/get_wallpapers_from_api_notifier.dart';



class ImageDetail extends StatelessWidget {
  const ImageDetail({Key? key,required this.wallpaper}) : super(key: key);
final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    final wallpaperUploader = context.select((GetWallpapersNotifier w) => w.wallpaperWithTags);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ImageSpecsBar(
          size: wallpaper.size,
          views: wallpaper.views,
          resolution: wallpaper.resolution,
          fontSize: 14.0,
          iconSize: 16.0,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showBottomMenu(
                context,
                '',
                ImageSpecsDialog(
                  wallpaper: wallpaperUploader,
                ),
              );
            },
            icon: const Icon(Icons.more_horiz_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 15.0,
            children: [
              Hero(
                tag: wallpaper.id,
                child: AspectRatio(
                  aspectRatio: 4 / 5,
                  child: Card(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        alignment: Alignment.center,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 1.0,
                            value: progress.progress,
                          ),
                        ),
                        imageUrl: wallpaper.path,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const ButtonsBar(
              ),
              const Suggestions(),
            ],
          ),
        ),
      ),
    );
  }
}
