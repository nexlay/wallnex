import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wallnex/features/preview/presentation/page/widgets/buttons/set_wallpaper_btn.dart';

enum Screen {
  home(screen: 1),
  lock(screen: 2),
  both(screen: 3);

  final int screen;
  const Screen({required this.screen});
}

class SetWallpaperButtonsBar extends StatelessWidget {
  const SetWallpaperButtonsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        SetWallpaperBtn(
          title: AppLocalizations.of(context)!.homeScreen,
          setOn: Screen.home,
        ),
        SetWallpaperBtn(
          title: AppLocalizations.of(context)!.lockScreen,
          setOn: Screen.lock,
        ),
        SetWallpaperBtn(
          title: AppLocalizations.of(context)!.both,
          setOn: Screen.both,
        ),
      ],
    );
  }
}
