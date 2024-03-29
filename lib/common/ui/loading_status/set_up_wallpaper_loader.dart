import 'dart:ui';
import 'package:flutter/material.dart';

class LoadingWhenWallpaperSetUp extends StatelessWidget {
  const LoadingWhenWallpaperSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: const CircularProgressIndicator(
          strokeWidth: 1.0,
        ),
      ),
    );
  }
}
