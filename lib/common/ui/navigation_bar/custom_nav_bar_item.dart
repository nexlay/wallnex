import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:provider/provider.dart';
import '../../../const/const_rive.dart';
import '../../provider/get_default_home_page_notifier.dart';


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
    final page = context.select((GetPages p) => p.value);
    _selected = widget.tabIndex == page;
    _active?.value = _selected;

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
                color: _selected ? Colors.red.shade50 : Colors.transparent,
              ),
              height: _selected ? 32 : 0,
              width: _selected ? 60 : 0,
              duration: const Duration(milliseconds: 100),
            ),
            GestureDetector(
              onTap: () {
                context.read<GetPages>().value = widget.tabIndex;
                setState(() {
                  _selected = !_selected;
                });
              },
              child: SizedBox(
                width: 60,
                height: _selected ? 32 : 30,
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
            fontSize: _selected ? 12.0 : 0.0,
          ),
        ),
      ],
    );
  }
}
