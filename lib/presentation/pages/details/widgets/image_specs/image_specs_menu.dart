import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../features/images/domain/entities/wallpaper.dart';
import '../../../../common/ui/animations/loading.dart';
import '../../../../provider/get_images_notifier.dart';
import 'image_colors.dart';
import 'image_specs_bar.dart';

class ImageSpecsDialog extends StatelessWidget {
  const ImageSpecsDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<GetImagesNotifier, Tuple2<Wallpaper, bool>>(
      selector: (_, provider) =>
          Tuple2(provider.wallpaperWithTags, provider.isLoading),
      builder: (_, value, __) {
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
                      value.value1.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: [
                        const Text(
                          'id: ',
                        ),
                        Text(
                          value.value1.id,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'category: ',
                        ),
                        Text(
                          value.value1.category,
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
                            if (!await launchUrl(
                                Uri.parse(value.value1.shortUrl))) {
                              throw 'Could not launch ${value.value1.shortUrl}';
                            }
                          },
                          child: Text(
                            value.value1.uploaderName,
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
                  size: value.value1.size,
                  views: value.value1.views,
                  resolution: value.value1.resolution,
                  fontSize: 14.0,
                  iconSize: 16.0,
                ),
                ImageColors(
                  list: value.value1.colors,
                ),
              ],
            ),
            value.value2
                ? Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                      child: const Loader(),
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
