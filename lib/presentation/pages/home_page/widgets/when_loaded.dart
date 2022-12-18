import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/common/image/image_card.dart';
import '../../../provider/get_wallpapers_from_api_notifier.dart';


class WhenLoaded extends StatelessWidget {
  const WhenLoaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = context.select((GetWallpapersNotifier n) => n.imageList);

    final size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: list.length,
          (context, index) {
            return ImageCard(wallpaper: list[index], routing: 'image_detail',);
          },
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: (itemWidth / itemHeight),
        ),
      ),
    );
  }
}
