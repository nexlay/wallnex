import 'package:flutter/material.dart';

class ChildWidget1 extends StatelessWidget {
  const ChildWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'What would you like to do?',
      style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
    );
  }
}

class ChildWidget2 extends StatelessWidget {
  const ChildWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.add_to_home_screen),
      label: const Text(
        'Set on home screen',
        style: TextStyle(
          fontSize: 22.0,
        ),
      ),
      onPressed: () {},
    );
  }
}

class ChildWidget3 extends StatelessWidget {
  const ChildWidget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.screen_lock_portrait),
      label: const Text(
        'Set on lock screen',
        style: TextStyle(fontSize: 22.0),
      ),
      onPressed: () {},
    );
  }
}

class ChildWidget4 extends StatelessWidget {
  const ChildWidget4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.phonelink_lock),
      label: const Text(
        'Set on both screen',
        style: TextStyle(fontSize: 22.0),
      ),
      onPressed: () {},
    );
  }
}
