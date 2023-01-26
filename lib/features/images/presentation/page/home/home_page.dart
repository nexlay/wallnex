import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../common/ui/image/image_card.dart';
import '../../provider/get_images_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = context.select((GetImagesNotifier n) => n.imageList);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: list.length,
          (context, index) {
            return ImageCard(
              wallpaper: list[index],
              url: list[index].thumbsLarge,
            );
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          childAspectRatio: (3 / 3),
        ),
      ),
    );
  }
}
