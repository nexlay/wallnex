import 'package:flutter/material.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import 'package:wallnex/presentation/common/animated_menu/menu.dart';
import 'package:wallnex/presentation/common/general_dialog.dart';
import 'package:wallnex/presentation/pages/wallpaper_detail_page/widgets/buttons_bar/buttons_bar.dart';
import 'package:wallnex/presentation/pages/wallpaper_detail_page/widgets/image_specs/image_specs_menu.dart';
import 'package:wallnex/presentation/pages/wallpaper_detail_page/widgets/image_specs/image_specs_bar.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ImageSpecsBar(
          size: wallpaper.size,
          downloads: wallpaper.downloads,
          resolution: wallpaper.resolution,
          fontSize: 14.0,
          iconSize: 16.0,
        ),
        actions: [
          IconButton(
            onPressed: () {
              GeneralDialog().displayDialog(
                context,
                AnimatedMenu(
                  childWidget1: ChildWidget1(
                    name: wallpaper.name,
                  ),
                  childWidget2: ChildWidget2(
                    id: wallpaper.id,
                    category: wallpaper.category,
                  ),
                  childWidget3: ChildWidget3(
                    size: wallpaper.size,
                    resolution: wallpaper.resolution,
                    downloads: wallpaper.downloads,
                  ),
                  childWidget4: ChildWidget4(
                    list: wallpaper.colors,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.more_horiz_outlined),
          ),
        ],
      ),
      body: Wrap(
        children: [
          Hero(
            tag: wallpaper.name,
            child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  wallpaper.path,
                ),
              ),
            ),
          ),
          ButtonsBar(
            imagePath: wallpaper.path,
          ),
        ],
      ),
    );
  }
}
