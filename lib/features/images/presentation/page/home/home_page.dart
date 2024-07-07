import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/customization_provider.dart';
import '../../../../../common/ui/image/image_card.dart';
import '../../../../../const/route_paths.dart';
import '../../../../suggestions/presentation/provider/get_suggestions_notifier.dart';
import '../../provider/get_images_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.select((GetImagesNotifier n) => n.imageList);
    final crossAxisCount = context
        .select((CustomizationProvider provider) => provider.crossAxisCount);
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
          showFavoriteBtn: false,
          showImageSpecsBtn: false,
          showSendBtn: false,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            crossAxisCount ? CrossAxis.big.value : CrossAxis.small.value,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
    );
  }
}
