import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/preview/presentation/page/widgets/buttons/set_wallpaper_buttons_bar.dart';
import '../../../../../file_manager/presentation/provider/file_manager_notifier.dart';
import '../../../provider/set_image_as_wallpaper_notifier.dart';

class SetWallpaperBtn extends StatelessWidget {
  const SetWallpaperBtn({super.key, required this.title, required this.setOn});

  final String title;
  final Screen setOn;

  @override
  Widget build(BuildContext context) {
    return Consumer<SetImageASWallpaperNotifier>(
      builder: (_, provider, __) => Badge(
        isLabelVisible: provider.value == setOn.screen,
        backgroundColor: provider.loading ? Colors.green : Colors.red,
        label: provider.loading
            ? const Icon(
                Icons.check,
                size: 9,
              )
            : const Icon(
                Icons.error,
                size: 9,
              ),
        child: ElevatedButton(
          child: Text(
            title,
          ),
          onPressed: () async {
            context.read<FileManagerNotifier>().cropInBackground().then(
                  (value) => context
                      .read<SetImageASWallpaperNotifier>()
                      .setImageAsWallpaper(value, setOn.screen),
                );
          },
        ),
      ),
    );
  }
}
