import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../file_manager/presentation/provider/file_manager_notifier.dart';
import '../../provider/set_image_as_wallpaper_notifier.dart';

class SetWallpaperButtonsBar extends StatelessWidget {
  const SetWallpaperButtonsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = [
      AppLocalizations.of(context)!.homeScreen,
      AppLocalizations.of(context)!.lockScreen,
      AppLocalizations.of(context)!.both,
    ];
    return ButtonBar(
      children: List<Widget>.generate(
        list.length,
        (index) => Consumer<SetImageASWallpaperNotifier>(
          builder: (_, provider, __) => Badge(
            showBadge: provider.loading && provider.setScreen == index + 1,
            badgeColor: provider.loading ? Colors.green : Colors.red,
            shape: BadgeShape.square,
            borderRadius: BorderRadius.circular(16.0),
            badgeContent: provider.loading
                ? const Icon(
                    Icons.check,
                    size: 9,
                  )
                : const Icon(
                    Icons.error,
                    size: 9,
                  ),
            animationType: BadgeAnimationType.scale,
            child: OutlinedButton(
              child: Text(
                list[index],
              ),
              onPressed: () async {
                context
                    .read<FileManagerNotifier>()
                    .getFileFromCache()
                    .whenComplete(
                      () => context
                          .read<FileManagerNotifier>()
                          .cropInBackground()
                          .then((value) => context
                              .read<SetImageASWallpaperNotifier>()
                              .setImageAsWallpaper(value, index + 1)),
                    );
              },
            ),
          ),
        ),
      ).toList(),
    );
  }
}
