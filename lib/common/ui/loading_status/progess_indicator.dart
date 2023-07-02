import 'package:flutter/material.dart';

class ProgressLoader extends StatelessWidget {
  const ProgressLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 1,
      ),
    );
  }
}
