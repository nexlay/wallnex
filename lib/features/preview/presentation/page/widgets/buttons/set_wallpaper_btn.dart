import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../file_manager/presentation/provider/file_manager_notifier.dart';
import '../../../provider/set_image_as_wallpaper_notifier.dart';

setWallpaperBtn(
    {required BuildContext context, required title, required setOn}) {
  return Center(
    child: OutlinedButton(
      onPressed: () {

        context.read<FileManagerNotifier>().cropInBackground().then(
              (value) => context
                  .read<SetImageASWallpaperNotifier>()
                  .setImageAsWallpaper(value, setOn.screen),
            ).then((onValue) => Navigator.pop(context));

      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    ),
  );
}
