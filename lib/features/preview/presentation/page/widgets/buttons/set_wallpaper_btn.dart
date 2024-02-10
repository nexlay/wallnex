import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import '../../../../../file_manager/presentation/provider/file_manager_notifier.dart';
import '../../../provider/set_image_as_wallpaper_notifier.dart';

setWallpaperBtn(
    {required BuildContext context, required title, required setOn}) {
  return Center(
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(MediaQuery.of(context).size.height / 20),
      ),
      onPressed: () {
        context.read<FileManagerNotifier>().cropInBackground().then(
              (value) => context
                  .read<SetImageASWallpaperNotifier>()
                  .setImageAsWallpaper(value, setOn.screen),
            );
      },
      child: Text(
        title,
      ),
    ),
  );
}
