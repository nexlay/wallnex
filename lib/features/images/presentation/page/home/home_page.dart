import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../../common/ui/image/image_card.dart';
import '../../../../../const/route_paths.dart';
import '../../../../suggestions/presentation/provider/get_suggestions_notifier.dart';
import '../../provider/get_images_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = context.select((GetImagesNotifier n) => n.imageList);
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: list.length,
        (context, index) => ImageCard(
          goTo: () {
            context.read<GetImagesNotifier>().getImageById(list[index].id);
            context
                .read<GetSuggestionsNotifier>()
                .getSuggestions(list[index].id);
            context.push(krDetails, extra: list[index]);
          },
          path: list[index].thumbsLarge,
          wallpaper: list[index],
          favorite: null,
          imageSpecs: null,
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
    );
  }
}
