import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/provider/get_cropped_image_notifier.dart';
import '../../../../const.dart';
import '../../../provider/set_image_as_wallpaper_notifier.dart';

class SetWallpaperButtonsBar extends StatelessWidget {
  const SetWallpaperButtonsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: List<Widget>.generate(
        setWallpaperList.length,
        (index) => OutlinedButton(
          child: Text(
            setWallpaperList[index],
          ),
          onPressed: () async {
            context.read<GetCroppedImageNotifier>().cropImage().then(
                  (value) => context
                      .read<SetImageASWallpaperNotifier>()
                      .setImageAsWallpaper(value, index + 1, context),
                );
          },
        ),
      ).toList(),
    );
  }
}
