import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';
import '../../../features/images/presentation/page/details/widgets/image_specs/image_colors.dart';
import '../../../features/images/presentation/page/details/widgets/image_specs/image_specs_bar.dart';
import '../../../features/images/presentation/provider/get_images_notifier.dart';
import '../animations/loading.dart';

void showImageInformation(BuildContext context) {
  showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32.0),
      ),
    ),
    context: context,
    builder: (context) {
      final wallpaper = context.select((GetImagesNotifier w) => w.wallpaper);
      final loading = context.select((GetImagesNotifier l) => l.isLoading);
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: loading
            ? const Loader()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Center(
                    child: Icon(
                      Icons.circle,
                      size: 10.0,
                    ),
                  ),
                  Text(
                    wallpaper.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      const Text(
                        'id: ',
                      ),
                      Text(
                        wallpaper.id,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        L.of(context).category,
                      ),
                      Text(
                        wallpaper.category,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        L.of(context).uploader,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (!await launchUrl(Uri.parse(wallpaper.shortUrl))) {
                            throw 'Could not launch ${wallpaper.shortUrl}';
                          }
                        },
                        child: Text(
                          wallpaper.uploaderName,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ImageSpecsBar(
                    size: wallpaper.size,
                    views: wallpaper.views,
                    resolution: wallpaper.resolution,
                    fontSize: 14.0,
                    iconSize: 16.0,
                  ),
                  ImageColors(
                    list: wallpaper.colors,
                  ),
                ],
              ),
      );
    },
  );
}
