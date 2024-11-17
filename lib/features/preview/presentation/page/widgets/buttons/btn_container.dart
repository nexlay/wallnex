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
    return ElevatedButton(
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
                        path: wallpaper.path,
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
                        path: wallpaper.path,
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
                        path: wallpaper.path,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      child: Text(
        'Apply',
        style: TextStyle(fontSize: kFontSizeMid, fontWeight: FontWeight.bold),
      ),
    );
  }
}
