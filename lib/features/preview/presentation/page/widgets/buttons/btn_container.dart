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

    return OutlinedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actionsOverflowButtonSpacing: kAppSize,
          actionsPadding: kAppPadding,
          title: const Center(
            child: Icon(
              Icons.wallpaper,
              size: kUnselectedIconSize,
            ),
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
      child: Text(locale.set_wallpaper_on),
    );
  }
}
