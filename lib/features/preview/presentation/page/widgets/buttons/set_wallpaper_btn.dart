import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../file_manager/presentation/provider/file_manager_notifier.dart';
import '../../../provider/set_image_as_wallpaper_notifier.dart';

setWallpaperBtn(
    {required BuildContext context, required title, required setOn}) {
  return PopupMenuItem<Widget?>(
    onTap: () {
      context.read<FileManagerNotifier>().cropInBackground().then(
            (value) => context
                .read<SetImageASWallpaperNotifier>()
                .setImageAsWallpaper(value, setOn.screen),
          );
    },
    child: Center(
      child: Text(title, style: const TextStyle(fontSize: 16.0),),
    ),
  );
}
