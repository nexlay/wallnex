import 'package:flutter/material.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../common/image/image_card.dart';

class SuggestionsBuilder extends StatelessWidget {
  const SuggestionsBuilder({Key? key, required this.suggestions})
      : super(key: key);

  final List<Wallpaper> suggestions;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;
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
          height: itemHeight,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: suggestions.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: SizedBox(
                  width: itemWidth,
                  child: ImageCard(
                    wallpaper: suggestions[index],
                    routing: 'suggestions',
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
