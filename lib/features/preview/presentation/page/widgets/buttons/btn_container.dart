import 'package:flutter/material.dart';
import 'package:wallnex/features/preview/presentation/page/widgets/buttons/preview_buttons_bar.dart';
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

const defaultValue = 20.0;

class BtnContainer extends StatelessWidget {
  const BtnContainer({super.key, required this.wallpaper});
  final Wallpaper wallpaper;
  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);

    return Card(
      child: PopupMenuButton<Widget?>(
        constraints: const BoxConstraints.tightFor(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultValue),
        ),
        icon: const Icon(Icons.arrow_drop_up),
        itemBuilder: (_) => [
          const PopupMenuItem<Widget?>(
            child: Center(
              child: Icon(Icons.arrow_drop_down),
            ),
          ),
          const PopupMenuItem<Widget?>(
            enabled: false,
            child: Center(
              child: Icon(
                Icons.wallpaper,
                size: defaultValue * 2,
              ),
            ),
          ),
          PopupMenuItem<Widget?>(
            enabled: false,
            child: Center(
              child: Text(
                locale.set_wallpaper_on,
                style: const TextStyle(fontSize: defaultValue),
              ),
            ),
          ),
          PopupMenuItem(
            child: Column(
              children: [
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
          PopupMenuItem<Widget?>(
            child: PreviewBar(wallpaper: wallpaper),
          ),
        ],
      ),
    );
  }
}
