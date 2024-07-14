import 'package:flutter/material.dart';
import 'package:wallnex/const/const.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../../../images/domain/entities/wallpaper.dart';
import 'set_wallpaper_btn.dart';

enum Screen {
  home(screen: 1),
  lock(screen: 2),
  both(screen: 3);

  final int screen;
  const Screen({required this.screen});
}

class SetUpBtn extends StatelessWidget {
  const SetUpBtn({super.key, required this.wallpaper});
  final Wallpaper wallpaper;
  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);

    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actionsOverflowButtonSpacing: kPaddingSize,
          actionsPadding:
              const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          icon: const Icon(
            Icons.wallpaper,
            size: 40,
          ),
          actions: [
            setWallpaperBtn(
              context: context,
              title: locale.homeScreen,
              setOn: Screen.home,
            ),
            setWallpaperBtn(
              context: context,
              title: locale.lockScreen,
              setOn: Screen.lock,
            ),
            setWallpaperBtn(
              context: context,
              title: locale.both,
              setOn: Screen.both,
            ),
          ],
        ),
      ),
      child: const Icon(Icons.done_outlined),
    );
  }
}
