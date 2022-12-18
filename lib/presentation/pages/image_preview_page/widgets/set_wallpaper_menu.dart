import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../const.dart';
import '../../../provider/set_image_as_wallpaper_notifier.dart';

class SetWallpaperMenu extends StatelessWidget {
  const SetWallpaperMenu({Key? key, required this.path}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20.0,
      children: [
        const SizedBox(
          width: 10.0,
        ),
        const Center(
          child: Text(
            'What would you like to do?',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        TextButton.icon(
          icon: const Icon(Icons.add_to_home_screen),
          label: const Text(
            'Set on home screen',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          onPressed: () {
            context
                .read<SetImageASWallpaperNotifier>()
                .setImageAsWallpaper(path, homeScreen, context);
          },
        ),
        TextButton.icon(
          icon: const Icon(Icons.screen_lock_portrait),
          label: const Text(
            'Set on lock screen',
            style: TextStyle(fontSize: 16.0),
          ),
          onPressed: () {
            context
                .read<SetImageASWallpaperNotifier>()
                .setImageAsWallpaper(path, lockScreen, context);
          },
        ),
        TextButton.icon(
          icon: const Icon(Icons.phonelink_lock),
          label: const Text(
            'Set on both screen',
            style: TextStyle(fontSize: 16.0),
          ),
          onPressed: () {
            context
                .read<SetImageASWallpaperNotifier>()
                .setImageAsWallpaper(path, bothScreen, context);
          },
        ),
      ],
    );
  }
}
