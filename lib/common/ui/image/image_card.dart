import 'package:flutter/material.dart';
import '../../../../features/images/domain/entities/wallpaper.dart';
import 'network_image_viewer.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.wallpaper,
    required this.favorite,
    required this.imageSpecs,
    required this.path,
    required this.goTo,
  }) : super(key: key);

  final Wallpaper wallpaper;
  final String path;
  final Widget? favorite;
  final Widget? imageSpecs;
  final Function()? goTo;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: wallpaper.id,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: goTo,
                child: NetworkImageViewer(
                  url: path,
                ),
              ),
            ),
            favorite ?? const SizedBox(),
            imageSpecs ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
