import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:provider/provider.dart';
import '../../../const.dart';
import '../../provider/get_home_page_notifier.dart';

class CustomNavBarItem extends StatefulWidget {
  const CustomNavBarItem(
      {Key? key,
      required this.path,
      required this.label,
      required this.tabIndex})
      : super(key: key);

  final String path;
  final String label;
  final int tabIndex;

  @override
  State<CustomNavBarItem> createState() => _CustomNavBarItemState();
}

class _CustomNavBarItemState extends State<CustomNavBarItem> {
  SMIBool? _active;
  bool _selected = false;

  void _onRiveInit(Artboard artboard) async {
    final controller = StateMachineController.fromArtboard(
      artboard,
      stateMachine,
    );
    artboard.addController(controller!);
    _active = controller.findInput<bool>(riveSwitch) as SMIBool;
  }

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<Pages>(context);
    _active?.value = widget.tabIndex == page.getIndex;
    _selected = widget.tabIndex == page.getIndex;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18.0),
                ),
                color: _selected ? rippleColor : Colors.transparent,
              ),
              height: _selected ? 35 : 0,
              width: _selected ? 65 : 0,
              //color: _selected ? rippleColor : Colors.transparent,
              duration: const Duration(milliseconds: 100),
            ),
            GestureDetector(
              onTap: () {
                page.setIndex = widget.tabIndex;
                setState(() {
                  _selected = !_selected;
                });
              },
              child: SizedBox(
                width: 65,
                height: 35,
                child: RiveAnimation.asset(
                  widget.path,
                  onInit: _onRiveInit,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          widget.label,
          style: TextStyle(
              fontSize: _selected ? 12.0 : 11.0,
              color: _selected ? selectedItemColor : mainLightThemeColor,
              fontWeight: _selected ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }
}
