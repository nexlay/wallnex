import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import '../../../../../file_manager/presentation/provider/file_manager_notifier.dart';
import '../../../provider/set_image_as_wallpaper_notifier.dart';

setWallpaperBtn(
    {required BuildContext context, required title, required setOn, required path}) {
  return TextButton(
    onPressed: () {
      context
          .read<FileManagerNotifier>()
          .cropInBackground()
          .then(
            (path) => context
                .read<SetImageASWallpaperNotifier>()
                .setImageAsWallpaper(path, setOn.screen),
          )
          .then((onValue) => Navigator.pop(context));
    },
    child: Text(
      title,
      style: const TextStyle(fontSize: kFontSizeMid),
    ),
  );
}
