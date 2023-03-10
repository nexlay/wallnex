import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../common/ui/image/image_card.dart';
import '../provider/get_suggestions_notifier.dart';


class SuggestionsPage extends StatelessWidget {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 30.0,
      children: [
       ListTile(
          title: Text(
            AppLocalizations.of(context)!.suggestions,
            style: const TextStyle(fontSize: 22.0),
          ),
          subtitle: Text(
            AppLocalizations.of(context)!.suggestionsDesc,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Selector<GetSuggestionsNotifier, List<Wallpaper>>(
            selector: (_, value) => value.suggestions,
            builder: (_, suggestions, __) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: suggestions.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: AspectRatio(
                    aspectRatio: 2 / 4,
                    child: ImageCard(
                      wallpaper: suggestions[index],
                      url: suggestions[index].thumbsLarge,
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
