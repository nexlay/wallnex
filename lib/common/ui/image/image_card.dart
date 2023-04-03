import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import '../../../../features/images/domain/entities/wallpaper.dart';
import '../../../features/suggestions/presentation/provider/get_suggestions_notifier.dart';
import 'network_image_viewer.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.wallpaper,
    required this.widget,
    required this.imageSpecs,
  }) : super(key: key);
  final Wallpaper wallpaper;

  final Widget? widget;
  final Widget? imageSpecs;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                context.push(krDetails, extra: wallpaper);
                context
                    .read<GetSuggestionsNotifier>()
                    .getSuggestions(wallpaper.id);
              },
              child: NetworkImageViewer(
                url: wallpaper.thumbsLarge,
              ),
            ),
          ),
          widget ?? const SizedBox(),
          imageSpecs ?? const SizedBox(),
        ],
      ),
    );
  }
}
