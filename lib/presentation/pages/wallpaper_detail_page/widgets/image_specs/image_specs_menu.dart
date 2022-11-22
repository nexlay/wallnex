import 'package:flutter/material.dart';
import 'package:wallnex/presentation/pages/wallpaper_detail_page/widgets/image_specs/image_colors.dart';
import 'image_specs_bar.dart';

class ChildWidget1 extends StatelessWidget {
  const ChildWidget1({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
      ),
    );
  }
}

class ChildWidget2 extends StatelessWidget {
  const ChildWidget2({Key? key, required this.id, required this.category})
      : super(key: key);
  final String id;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20.0,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ID: ',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              id,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Category: ',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              category,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}

class ChildWidget3 extends StatelessWidget {
  const ChildWidget3(
      {Key? key,
      required this.size,
      required this.resolution,
      required this.downloads})
      : super(key: key);
  final String size;
  final String downloads;
  final String resolution;

  @override
  Widget build(BuildContext context) {
    return ImageSpecsBar(
      size: size,
      downloads: downloads,
      resolution: resolution,
      fontSize: 18.0,
      iconSize: 20.0,
    );
  }
}

class ChildWidget4 extends StatelessWidget {
  const ChildWidget4({Key? key, required this.list}) : super(key: key);
  final List list;

  @override
  Widget build(BuildContext context) {
    return ImageColors(
      list: list,
    );
  }
}
