import 'package:flutter/material.dart';
import 'package:wallnex/common/ui/image/widgets/image_info.dart';
import '../../../../features/images/domain/entities/wallpaper.dart';
import '../../../const/const.dart';
import '../buttons/favorite_button.dart';
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
    this.showFavoriteText = true,
    this.showFavoriteCircleAvatar = false,
  });

  final Wallpaper wallpaper;
  final String path;
  final bool showFavoriteBtn;
  final bool showImageSpecsBtn;
  final bool showSendBtn;
  final bool showFavoriteText;
  final bool showFavoriteCircleAvatar;
  final Function()? goTo;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: wallpaper.id,
      child: Card(
        elevation: kAppSize,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: goTo,
                child: NetworkImageViewer(
                  url: path,
                  imageColor: wallpaper.colors.isNotEmpty
                      ? Color(
                          int.parse(
                            wallpaper.colors[2].replaceFirst('#', '0xff'),
                          ),
                        )
                      : Colors.grey,
                ),
              ),
            ),
            Positioned(
              bottom: kAppSize,
              right: kAppSize,
              child: Visibility(
                visible: showFavoriteBtn,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FavoriteButton(
                    wallpaper: wallpaper,
                    showText: showFavoriteText,
                    showCircleAvatar: showFavoriteCircleAvatar,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: kAppSize,
              left: kAppSize,
              child: Visibility(
                visible: showImageSpecsBtn,
                child: const ImageInformation(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
