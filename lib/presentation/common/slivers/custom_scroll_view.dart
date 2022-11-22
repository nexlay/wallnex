import 'package:flutter/material.dart';

class BodyScrollView extends StatelessWidget {
  const BodyScrollView({Key? key, required this.title, required this.childWidget})
      : super(key: key);
  final String title;
  final Widget childWidget;

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
        childWidget,
      ],
    );
  }
}
