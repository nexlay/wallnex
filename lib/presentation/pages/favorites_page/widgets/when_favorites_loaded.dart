import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../domain/entities/wallpaper.dart';
import '../../../provider/get_favorites_wallpapers_notifier.dart';
import '../../wallpaper_detail_page/image_detail_page.dart';

class WhenFavoritesLoaded extends StatelessWidget {
  const WhenFavoritesLoaded(
      {Key? key, required this.favoritesList, required this.imagesList})
      : super(key: key);
  final List<Wallpaper> favoritesList;
  final List<Wallpaper> imagesList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 15.0,
          children: [
            SizedBox(
              height: itemHeight,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: favoritesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Hero(
                    tag: favoritesList[index].name,
                    child: SizedBox(
                      width: itemWidth,
                      child: Card(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10.0),
                          onTap: () {
                            context
                                .read<GetFavoritesNotifier>()
                                .checkFavorites(favoritesList[index]);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ImageDetail(
                                  wallpaper: favoritesList[index],
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              favoritesList[index].path,
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
            favoritesList.isNotEmpty ? const ListTile(
              title: Text(
                'Suggestions',
              ),
              subtitle: Text(
                'based on your favorites',
              ),
            ) : const SizedBox(),
            favoritesList.isNotEmpty ? SizedBox(
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
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
