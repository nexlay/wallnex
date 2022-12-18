import 'package:flutter/material.dart';

class BodyScrollView extends StatelessWidget {
  const BodyScrollView({Key? key, required this.title, required this.childWidget1, required this.childWidget2})
      : super(key: key);
  final String title;
  final Widget childWidget1;
  final Widget childWidget2;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          expandedHeight: MediaQuery.of(context).size.height/7,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            expandedTitleScale: 1.5,
          ),
        ),
        childWidget1,
        const SliverPadding(padding: EdgeInsets.only(bottom: 15.0),),
        childWidget2,
      ],
    );
  }
}
