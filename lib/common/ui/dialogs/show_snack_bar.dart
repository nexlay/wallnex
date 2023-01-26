import 'package:flutter/material.dart';

SnackBar showSnackBar(String text) => SnackBar(
      margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
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
      duration: const Duration(milliseconds: 4000),
    );
