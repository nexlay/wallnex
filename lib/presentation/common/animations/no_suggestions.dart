import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:wallnex/const.dart';


class EmptySuggestions extends StatelessWidget {
  const EmptySuggestions({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const ListTile(
          title: Text(
            'No suggestions yet!',
            style: TextStyle(fontSize: 22.0),
          ),
          subtitle: Text("There is no similar images."),
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
