import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/presentation/provider/get_suggestions_notifier.dart';

import '../../common/ui/image/image_card.dart';


class SuggestionsPage extends StatelessWidget {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 30.0,
      children: [
        const ListTile(
          title: Text(
            'Suggestions',
            style: TextStyle(fontSize: 22.0),
          ),
          subtitle: Text(
            'based on chosen image',
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
