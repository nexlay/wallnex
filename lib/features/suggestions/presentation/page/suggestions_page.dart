import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../common/ui/image/image_card.dart';

import '../../../../const/route_paths.dart';
import '../../../images/presentation/provider/get_images_notifier.dart';
import '../provider/get_suggestions_notifier.dart';

class SuggestionsPage extends StatelessWidget {
  const SuggestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<GetSuggestionsNotifier, List<Wallpaper>>(
      selector: (_, value) => value.suggestions,
      builder: (_, suggestions, __) => ListView.separated(
        padding: const EdgeInsets.only(bottom: 10.0),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 1.0,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: suggestions.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return AspectRatio(
            aspectRatio: 2 / 3,
            child: ImageCard(

              goTo: () {
                context
                    .read<GetSuggestionsNotifier>()
                    .getSuggestions(suggestions[index].id);
                context
                    .read<GetImagesNotifier>()
                    .getImageById(suggestions[index].id);
                context.push(krDetails, extra: suggestions[index]);
              },
              path: suggestions[index].thumbsLarge,
              wallpaper: suggestions[index],
              showFavoriteBtn: false,
              showImageSpecsBtn: false, showSendBtn: false,
            ),
          );
        },
      ),
    );
  }
}
