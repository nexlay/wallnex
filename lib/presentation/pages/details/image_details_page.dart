import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/pages/details/widgets/buttons_bar/buttons_bar.dart';
import 'package:wallnex/presentation/pages/details/widgets/image_specs/image_specs_bar.dart';
import 'package:wallnex/presentation/pages/details/widgets/image_specs/image_specs_menu.dart';
import 'package:wallnex/presentation/pages/suggestions/suggestions.dart';
import '../../../features/images/domain/entities/wallpaper.dart';
import '../../common/ui/image/network_image_viewer.dart';
import '../../common/ui/modal_bottom_sheet/show_bottom_sheet.dart';
import '../../provider/get_images_notifier.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
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
              context
                  .read<GetImagesNotifier>()
                  .getTagsAndUploader(wallpaper.id);

              showBottomMenu(
                context,
                const ImageSpecsDialog(),
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
                  aspectRatio: 3 / 2,
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
              const Suggestions(),
            ],
          ),
        ),
      ),
    );
  }
}
