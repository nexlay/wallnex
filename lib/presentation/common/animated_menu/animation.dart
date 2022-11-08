import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({
    Key? key,
    required this.controller,
    required this.childWidget1,
    required this.childWidget2,
    required this.childWidget3,
    required this.childWidget4,
  })  : opacity1 = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.250,
              curve: Curves.ease,
            ),
          ),
        ),
        opacity2 = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.250,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        opacity3 = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.500,
              0.750,
              curve: Curves.ease,
            ),
          ),
        ),
        opacity4 = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.750,
              1.0,
              curve: Curves.ease,
            ),
          ),
        ),
        padding1 = Tween<EdgeInsets>(
          begin: const EdgeInsets.only(bottom: 0.0),
          end: const EdgeInsets.only(bottom: 70.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.00,
              0.250,
              curve: Curves.ease,
            ),
          ),
        ),
        padding2 = Tween<EdgeInsets>(
          begin: const EdgeInsets.only(bottom: 0.0),
          end: const EdgeInsets.only(bottom: 70.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.250,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        padding3 = Tween<EdgeInsets>(
          begin: const EdgeInsets.only(bottom: 0.0),
          end: const EdgeInsets.only(bottom: 70.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.500,
              0.750,
              curve: Curves.ease,
            ),
          ),
        ),
        padding4 = Tween<EdgeInsets>(
          begin: const EdgeInsets.only(bottom: 0.0),
          end: const EdgeInsets.only(bottom: 70.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.750,
              1.00,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final Animation<double> opacity1;
  final Animation<double> opacity2;
  final Animation<double> opacity3;
  final Animation<double> opacity4;
  final Animation<EdgeInsets> padding1;
  final Animation<EdgeInsets> padding2;
  final Animation<EdgeInsets> padding3;
  final Animation<EdgeInsets> padding4;
  final AnimationController controller;
  final Widget childWidget1;
  final Widget childWidget2;
  final Widget childWidget3;
  final Widget childWidget4;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Wrap(
            alignment: WrapAlignment.start,
            children: [
              Container(
                padding: padding1.value,
                child: Opacity(
                  opacity: opacity1.value,
                  child:
                      childWidget1,
                ),
              ),
              Container(
                padding: padding2.value,
                child: Opacity(
                  opacity: opacity2.value,
                  child:
                      childWidget2,
                ),
              ),
              Container(
                padding: padding3.value,
                child: Opacity(
                  opacity: opacity3.value,
                  child:
                      childWidget3,
                ),
              ),
              Container(
                padding: padding4.value,
                child: Opacity(
                  opacity: opacity4.value,
                  child:
                      childWidget4,
                ),
              ),
            ],
          );
        });
  }
}
