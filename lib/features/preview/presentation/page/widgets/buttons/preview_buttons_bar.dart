import 'package:flutter/material.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../../../common/ui/buttons/favorite_button.dart';
import '../../../../../../common/ui/pop_up_dialogs/pop_up_specs_menu.dart';
import 'download_btn.dart';

class PreviewBar extends StatelessWidget {
  const PreviewBar({super.key, required this.wallpaper});
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      mainAxisSize: MainAxisSize.max,
      children: [
        FavoriteButton(
          wallpaper: wallpaper,
        ),
        DownloadBtn(
          wallpaper: wallpaper,
        ),
        showPopUpMenu(
          context: context,
          id: wallpaper.id,
        ),
      ],
    );
  }
}
