import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wallnex/const.dart';
import 'package:wallnex/presentation/common/animated_menu/menu.dart';
import 'package:wallnex/presentation/common/general_dialog.dart';
import 'package:wallnex/presentation/pages/wallpaper_detail_page/widgets/set_wallpaper_menu/set_wallpaper_menu.dart';

class ButtonsBarItem extends StatefulWidget {
  const ButtonsBarItem({Key? key, required this.path, required this.imagePath, required this.index})
      : super(key: key);

  final String path;
  final String imagePath;
  final int index;

  @override
  State<ButtonsBarItem> createState() => _ButtonsBarState();
}

class _ButtonsBarState extends State<ButtonsBarItem> {
  SMIBool? active;
  bool isFavorite = false;

  void onRiveInit(Artboard artboard) async {
    final controller = StateMachineController.fromArtboard(
      artboard,
      stateMachine,
    );
    artboard.addController(controller!);
    active = controller.findInput<bool>(riveSwitch) as SMIBool;
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        OutlinedButton(
          onPressed: () {
            if(widget.index == 0) {
            active?.value = !(active?.value)!;
            GeneralDialog().displayDialog(
              context,
              const AnimatedMenu(
                childWidget1: ChildWidget1(),
                childWidget2: ChildWidget2(),
                childWidget3: ChildWidget3(),
                childWidget4: ChildWidget4(),
              ),
            );}
            else {
              active?.value = !(active?.value)!;
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SizedBox(
              height: 35,
              width: 55,
              child: RiveAnimation.asset(
                widget.path,
                onInit: onRiveInit,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
