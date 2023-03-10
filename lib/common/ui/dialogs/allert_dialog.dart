import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> showMyDialog(
    context, title, content, actionTitle1, actionTitle2) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          ElevatedButton(
            child: Text(actionTitle1),
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
          ),
          OutlinedButton(
            child: Text(actionTitle2),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
