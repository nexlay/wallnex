import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../domain/entities/wallpaper.dart';
import '../../../provider/get_favorites_wallpapers_notifier.dart';
import '../../wallpaper_detail_page/image_detail_page.dart';
class WhenLoaded extends StatelessWidget {
  const WhenLoaded({Key? key, required this.wallpapersList}) : super(key: key);
  final List<Wallpaper> wallpapersList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: wallpapersList.length,
            (context, index) {
          return Hero(
            tag: wallpapersList[index].name,
            child: Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
                onTap: () {
                  context.read<GetFavoritesNotifier>().checkFavorites(wallpapersList[index]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ImageDetail(
                        wallpaper: wallpapersList[index],
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    wallpapersList[index].path,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
      ),
    );
  }
}