import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import '../../../../../../../common/ui/animations/loading.dart';
import 'image_colors.dart';
import 'image_specs_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImageSpecsDialog extends StatelessWidget {
  const ImageSpecsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wallpaper = context.select((GetImagesNotifier w) => w.wallpaper);
    final loading = context.select((GetImagesNotifier l) => l.isLoading);

    return Stack(
      children: [
        Wrap(
          runSpacing: 30.0,
          children: [
            Wrap(
              spacing: 30.0,
              direction: Axis.vertical,
              children: [
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
                      AppLocalizations.of(context)!.category,
                    ),
                    Text(
                      wallpaper.category,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.uploader,
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
            loading
                ? Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                      child: const Loader(),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
