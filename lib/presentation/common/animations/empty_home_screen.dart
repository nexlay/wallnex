import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wallnex/const.dart';


class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const ListTile(
          title: Text(
            'Oops... Images not found!',
            style: TextStyle(fontSize: 22.0),
          ),
          subtitle: Text("Try to reload later."),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height /3 ,
          width: MediaQuery.of(context).size.width/2,
          child: const RiveAnimation.asset(
            emptySuggestions,
            animations: ['lens','animate'],
          ),
        ),
      ],
    );
  }
}
