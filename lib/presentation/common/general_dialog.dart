import 'package:flutter/material.dart';

class GeneralDialog {
  Future<void> displayDialog(BuildContext context, Widget childWidget) async {
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.85),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: childWidget,
              ),
            ),
          ),
        );
      },
    );
  }
}
