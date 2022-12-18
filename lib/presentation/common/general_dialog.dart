import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/provider/get_theme_notifier.dart';
import '../provider/set_image_as_wallpaper_notifier.dart';
import 'animations/loading.dart';

displayDialog(BuildContext context, Widget childWidget) {
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
      bool isDarkMode =
          context.select((GetThemeNotifier mode) => mode.themeModeDark);
      final loading =
          context.select((SetImageASWallpaperNotifier l) => l.loading);
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: isDarkMode
              ? Colors.black.withOpacity(0.85)
              : Colors.white.withOpacity(0.95),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Center(child: childWidget),
                loading
                    ? Positioned.fill(
                  //TODO: Make this in parent widget
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                            child: const Loader()),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      );
    },
  );
}
