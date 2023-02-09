import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../../../common/ui/buttons/favorite_button.dart';
import '../../../../../../../common/ui/modal_bottom_sheet/show_bottom_sheet.dart';
import '../../../../../images/presentation/provider/get_images_notifier.dart';
import 'download_btn.dart';


class PreviewBar extends StatelessWidget {
  const PreviewBar({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        FavoriteButton(
          wallpaper: wallpaper,
        ),
        IconButton(
          onPressed: () {
            context.read<GetImagesNotifier>().getImageById(wallpaper.id);
            showBottomMenu(
              context,
            );
          },
          icon: const Icon(
            Icons.info_outline,
          ),
        ),
      DownloadBtn(wallpaper: wallpaper,),
      ],
    );
  }
}
