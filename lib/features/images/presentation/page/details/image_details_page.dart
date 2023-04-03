import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/images/presentation/page/details/widgets/buttons_bar/buttons_bar.dart';
import 'package:wallnex/features/images/presentation/page/details/widgets/image_specs/image_specs_bar.dart';
import '../../../../../common/ui/image/network_image_viewer.dart';
import '../../../../../common/ui/modal_bottom_sheet/show_bottom_sheet.dart';
import '../../../../suggestions/presentation/page/suggestions.dart';
import '../../../domain/entities/wallpaper.dart';
import '../../provider/get_images_notifier.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(krRoot),
          icon: const Icon(Icons.arrow_back),
        ),
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
              context.read<GetImagesNotifier>().getImageById(wallpaper.id);
              showImageInformation(
                context,
              );
            },
            icon: const Icon(Icons.more_horiz_outlined),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Hero(
              tag: wallpaper.id,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: NetworkImageViewer(
                  url: wallpaper.path,
                ),
              ),
            ),
          ),
          ButtonsBar(
            wallpaper: wallpaper,
          ),
          const Expanded(
            child: Center(
              child: Suggestions(),
            ),
          ),
        ],
      ),
    );
  }
}
