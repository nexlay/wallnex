import 'package:flutter/material.dart';

Future<void> showMyDialog(
    context, title, content, actionTitle1, actionTitle2, function) async {
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
              function;
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
