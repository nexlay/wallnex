import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../common/ui/image/image_card.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../provider/get_suggestions_notifier.dart';

class SuggestionsPage extends StatelessWidget {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: Text(
            locale.suggestions,
            style: const TextStyle(fontSize: 22.0),
          ),
          subtitle: Text(
            locale.suggestionsDesc,
          ),
        ),
        Selector<GetSuggestionsNotifier, List<Wallpaper>>(
          selector: (_, value) => value.suggestions,
          builder: (_, suggestions, __) => Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 1.0,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: suggestions.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: AspectRatio(
                    aspectRatio: 1 / 2,
                    child: ImageCard(
                      wallpaper: suggestions[index],
                      widget: null,
                      imageSpecs: null,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
