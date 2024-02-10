import 'package:flutter/material.dart';
import 'package:wallnex/common/ui/buttons/send_message_button.dart';
import '../../../../features/images/domain/entities/wallpaper.dart';
import '../../../const/const.dart';
import '../buttons/favorite_button.dart';
import '../pop_up_dialogs/pop_up_specs_menu.dart';
import 'network_image_viewer.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.wallpaper,
    required this.showFavoriteBtn,
    required this.showImageSpecsBtn,
    required this.showSendBtn,
    required this.path,
    required this.goTo,
  });

  final Wallpaper wallpaper;
  final String path;
  final bool showFavoriteBtn;
  final bool showImageSpecsBtn;
  final bool showSendBtn;
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
                  imageColor: wallpaper.colors[2],
                ),
              ),
            ),
            Visibility(
              visible: showFavoriteBtn,
              child: Positioned(
                bottom: kAppSize,
                left: kAppSize,
                child: FavoriteButton(wallpaper: wallpaper),
              ),
            ),
            Visibility(
              visible: showImageSpecsBtn,
              child: Positioned(
                top: kAppSize,
                left: kAppSize,
                child: showPopUpMenu(
                  context: context,
                  id: wallpaper.id,
                ),
              ),
            ),
            Visibility(
              visible: showSendBtn,
              child: Positioned(
                bottom: kAppSize,
                right: kAppSize,
                child: SendMessageBtn(
                  wallpaper: wallpaper,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
