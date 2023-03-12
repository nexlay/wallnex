import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../common/ui/image/image_card.dart';
import '../../provider/get_images_notifier.dart';

const padding = 20.0;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = context.select((GetImagesNotifier n) => n.imageList);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: padding),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: list.length,
          (context, index) {
            return ImageCard(
              wallpaper: list[index],
              widget: null,
              imageSpecs: null,
            );
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
      ),
    );
  }
}
