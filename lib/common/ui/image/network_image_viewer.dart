import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../loading_status/loader.dart';

class NetworkImageViewer extends StatelessWidget {
  const NetworkImageViewer({super.key, required this.url, this.imageColor});
  final String url;
  final String? imageColor;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      filterQuality: FilterQuality.none,
      alignment: FractionalOffset.center,
      errorWidget: (_, url, error) => const Icon(
        Icons.broken_image,
        size: 50.0,
      ),
      progressIndicatorBuilder: (_, url, progress) => Loader(
        progress: progress.progress,
        imageColor: imageColor,
      ),
      imageUrl: url,
      fit: BoxFit.cover,
    );
  }
}
