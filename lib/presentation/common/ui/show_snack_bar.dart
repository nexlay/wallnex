import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    margin: const EdgeInsets.symmetric(horizontal: 120),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(24.0),
      ),
    ),
    content: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25,
          width: 25,
          child: Image.asset('assets/core/launch_image.png'),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    elevation: 2.0,
    duration: const Duration(milliseconds: 3000),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
