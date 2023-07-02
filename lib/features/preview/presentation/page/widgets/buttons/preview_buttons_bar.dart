import 'package:flutter/material.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../../../common/ui/buttons/favorite_button.dart';
import '../../../../../../common/ui/buttons/pop_up_specs_menu.dart';
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
        showPopUpMenu(
          context: context,
          id: wallpaper.id,
        ),
        DownloadBtn(
          wallpaper: wallpaper,
        ),
      ],
    );
  }
}
