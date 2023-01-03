import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../common/ui/favorite_button.dart';
import '../../../common/ui/modal_bottom_sheet/show_bottom_sheet.dart';
import '../../../provider/get_images_notifier.dart';
import '../../details/widgets/image_specs/image_specs_menu.dart';

class PreviewBar extends StatelessWidget {
  const PreviewBar({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
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
          icon: const Icon(
            Icons.info_outline,
          ),
        ),
        FavoriteButton(
          wallpaper: wallpaper,
        ),
      ],
    );
  }
}
