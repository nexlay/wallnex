import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:wallnex/const.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import 'package:wallnex/presentation/common/animated_menu/menu.dart';
import 'package:wallnex/presentation/common/general_dialog.dart';
import 'package:wallnex/presentation/pages/wallpaper_detail_page/widgets/set_wallpaper_menu/set_wallpaper_menu.dart';
import 'package:wallnex/presentation/provider/get_favorites_wallpapers_notifier.dart';

class ButtonsBar extends StatefulWidget {
  const ButtonsBar({
    Key? key,
    required this.wallpaper,
  }) : super(key: key);

  final Wallpaper wallpaper;

  @override
  State<ButtonsBar> createState() => _ButtonsBarState();
}

class _ButtonsBarState extends State<ButtonsBar> {
  late SMIBool active;

  late bool isFavorite;

  void onRiveInit(Artboard artboard) async {
    final controller = StateMachineController.fromArtboard(
      artboard,
      stateMachine,
    );
    artboard.addController(controller!);
    active = controller.findInput<bool>(riveSwitch) as SMIBool;

    active.value = isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    isFavorite = context.select((GetFavoritesNotifier f) => f.isFavorite);
    return ButtonBar(
      children: [
        OutlinedButton(
          onPressed: () {
            GeneralDialog().displayDialog(
              context,
              const AnimatedMenu(
                childWidget1: ChildWidget1(),
                childWidget2: ChildWidget2(),
                childWidget3: ChildWidget3(),
                childWidget4: ChildWidget4(),
              ),
            );
          },
          child: const Icon(
            Icons.check_circle,
            color: mainLightThemeColor,
            size: 35,
          ),
        ),
        OutlinedButton(
          onPressed: () {
            active.value = !active.value;

            if (isFavorite) {
              context
                  .read<GetFavoritesNotifier>()
                  .deleteFromFavorites(widget.wallpaper);
            } else {
              context
                  .read<GetFavoritesNotifier>()
                  .insertIntoFavorites(widget.wallpaper);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SizedBox(
              height: 35,
              width: 55,
              child: RiveAnimation.asset(
                favorite,
                onInit: onRiveInit,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
