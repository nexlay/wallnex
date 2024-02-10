import 'package:wallnex/common/ui/image/image_card.dart';
import 'package:flutter/material.dart';
import '../../../../../common/ui/image/network_image_viewer.dart';

class SendImageCard extends ImageCard {
  const SendImageCard(
      {super.key,
      required super.wallpaper,
      required super.showFavoriteBtn,
      required super.showImageSpecsBtn,
      required super.showSendBtn,
      required super.path,
      required super.goTo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GestureDetector(
          onTap: goTo,
          child: NetworkImageViewer(
            url: path,
          ),
        ),
      ),
    );
  }
}
