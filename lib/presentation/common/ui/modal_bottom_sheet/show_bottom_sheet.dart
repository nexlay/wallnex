import 'package:flutter/material.dart';

void showBottomMenu(BuildContext context, Widget childWidget) {
  showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32.0),
      ),
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Center(
              child: Icon(
                Icons.circle,
                size: 12.0,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            childWidget
          ],
        ),
      );
    },
  );
}
