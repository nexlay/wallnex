import 'package:flutter/material.dart';
import 'package:wallnex/const.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/presentation/common/ui/favorite_button.dart';
import '../../../preview/preview_page.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({
    Key? key,
    required this.wallpaper,
  }) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PreviewPage(
                  wallpaper: wallpaper,
                ),
              ),
            );
          },
          child: const Text(previewLabel),
        ),
        FavoriteButton(wallpaper: wallpaper),
      ],
    );
  }
}
