import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import 'package:wallnex/presentation/common/animated_menu/menu.dart';
import 'package:wallnex/presentation/common/general_dialog.dart';
import 'package:wallnex/presentation/pages/wallpaper_detail_page/widgets/buttons_bar/buttons_bar.dart';

import 'package:wallnex/presentation/pages/wallpaper_detail_page/widgets/image_specs/image_specs_menu.dart';
import 'package:wallnex/presentation/pages/wallpaper_detail_page/widgets/image_specs/image_specs_bar.dart';

import '../../provider/get_favorites_wallpapers_notifier.dart';
import '../../provider/get_wallpapers_from_api_notifier.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    final imagesList = context.select((GetWallpapersNotifier l) => l.imageList);
    final size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;
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
      body: SingleChildScrollView(
        child: Wrap(
          runSpacing: 15.0,
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
              wallpaper: wallpaper,
            ),
            const ListTile(
              title: Text(
                'Suggestions',
              ),
              subtitle: Text(
                'based on your favorites',
              ),
            ),
            SizedBox(
              height: itemHeight,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: imagesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Hero(
                    tag: imagesList[index].name,
                    child: SizedBox(
                      width: itemWidth,
                      child: Card(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10.0),
                          onTap: () {
                            context
                                .read<GetFavoritesNotifier>()
                                .checkFavorites(imagesList[index]);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ImageDetail(
                                  wallpaper: imagesList[index],
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              imagesList[index].path,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
