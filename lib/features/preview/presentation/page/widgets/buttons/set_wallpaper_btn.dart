import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import '../../../../../file_manager/presentation/provider/file_manager_notifier.dart';
import '../../../provider/set_image_as_wallpaper_notifier.dart';

setWallpaperBtn(
    {required BuildContext context,
    required title,
    required setOn,
    required path}) {
  return TextButton(
    onPressed: () {
      final notifier = context.read<SetImageASWallpaperNotifier>();
      notifier.reset();
      notifier.setLoading(true, setOn.screen);
      context
          .read<FileManagerNotifier>()
          .cropInBackground()
          .then(
            (path) => notifier.setImageAsWallpaper(path, setOn.screen),
          )
          .then((onValue) => Navigator.pop(context));
    },
    child: Consumer<SetImageASWallpaperNotifier>(
      builder: (context, notifier, _) {
        return notifier.loading && notifier.value == setOn.screen
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              )
            : Text(
                title,
                style: const TextStyle(fontSize: kFontSizeMid),
              );
      },
    ),
  );
}
