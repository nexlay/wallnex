import 'package:flutter/material.dart';
import 'package:wallnex/const/const.dart';
import '../../../../../../common/ui/buttons/favorite_button.dart';
import '../../../../../../common/ui/pop_up_dialogs/pop_up_specs_menu.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../../../images/domain/entities/wallpaper.dart';
import 'download_btn.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: LayoutBuilder(
                // Use LayoutBuilder to get constraints
                builder: (context, constraints) {
                  return IntrinsicWidth(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: kAppPadding,
                          child: Icon(
                            Icons.wallpaper,
                            size: 40,
                          ),
                        ),
                        ConstrainedBox(
                          // Constrain width of each button
                          constraints: BoxConstraints(
                            maxWidth:
                                constraints.maxWidth, // Use Dialog's max width
                          ),
                          child: setWallpaperBtn(
                            context: context,
                            title: locale.homeScreen,
                            setOn: Screen.home,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth,
                          ),
                          child: setWallpaperBtn(
                            context: context,
                            title: locale.lockScreen,
                            setOn: Screen.lock,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth,
                          ),
                          child: setWallpaperBtn(
                            context: context,
                            title: locale.both,
                            setOn: Screen.both,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          child: const Icon(Icons.done_outlined),
        ),
        const SizedBox(height: kHeightForSpacer,),
        FavoriteButton(
          wallpaper: wallpaper,
        ),
        DownloadBtn(
          wallpaper: wallpaper,
        ),
        showPopUpMenu(
          context: context,
          id: wallpaper.id,
        ),
      ],
    );
  }
}
