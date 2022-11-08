import 'package:flutter/material.dart';
import 'package:wallnex/presentation/common/animated_menu/animation.dart';

class AnimatedMenu extends StatefulWidget {
  const AnimatedMenu({
    Key? key,
    required this.childWidget1,
    required this.childWidget2,
    required this.childWidget3,
    required this.childWidget4,
  }) : super(key: key);

  final Widget childWidget1;
  final Widget childWidget2;
  final Widget childWidget3;
  final Widget childWidget4;
  @override
  State<AnimatedMenu> createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _playAnimation();
  }

  Future<void> _playAnimation() async {
    try {
      await _animationController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    return StaggerAnimation(
      controller: _animationController,
      childWidget1: widget.childWidget1,
      childWidget2: widget.childWidget2,
      childWidget3: widget.childWidget3,
      childWidget4: widget.childWidget4,
    );
  }
}
