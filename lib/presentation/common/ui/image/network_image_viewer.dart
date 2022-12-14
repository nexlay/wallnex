import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageViewer extends StatelessWidget {
  const NetworkImageViewer({Key? key, required this.url})
      : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      filterQuality: FilterQuality.none,
      alignment: FractionalOffset.center,
      errorWidget: (_, url, error) => const Icon(
        Icons.broken_image,
        size: 50.0,
      ),
      progressIndicatorBuilder: (_, url, progress) => Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          value: progress.progress,
        ),
      ),
      imageUrl: url,
      fit: BoxFit.cover,
    );
  }
}
