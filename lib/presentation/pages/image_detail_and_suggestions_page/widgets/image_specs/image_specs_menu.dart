import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../features/images/domain/entities/wallpaper.dart';
import 'image_colors.dart';
import 'image_specs_bar.dart';

class ImageSpecsDialog extends StatelessWidget {
  const ImageSpecsDialog({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 30.0,
      children: [
        Wrap(
          spacing: 30.0,
          direction: Axis.vertical,
          children: [
            Text(
              wallpaper.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                const Text(
                  'category: ',
                ),
                Text(
                  wallpaper.category,
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'uploader: ',
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
      ],
    );
  }
}
