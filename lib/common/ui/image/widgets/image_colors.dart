import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../const/const.dart';
import '../../../../features/suggestions/presentation/provider/get_suggestions_notifier.dart';

class ImageColors extends StatelessWidget {
  const ImageColors({super.key, required this.wallpaper});
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return Consumer<GetSuggestionsNotifier>(
      builder: (context, suggestionsNotifier, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: wallpaper.colors.map((dynamic colorHex) {
            if (colorHex is String && colorHex.isNotEmpty) {
              final color =
                  Color(int.parse(colorHex.replaceFirst('#', '0xff')));
              return InkWell(
                borderRadius: BorderRadius.circular(kUnselectedIconSize / 2),
                onTap: () async {
                  await suggestionsNotifier.getSuggestionsByColor(
                      colorHex.replaceFirst('#', ''), wallpaper.id);
                  // You might want to navigate to a new screen or update the UI here
                },
                child: Card(
                  elevation: kAppSize,
                  color: color,
                  child: SizedBox(
                    height: kUnselectedIconSize,
                    width: kUnselectedIconSize,
                    child: suggestionsNotifier.isLoading
                        ? const CircularProgressIndicator()
                        : null,
                  ),
                ),
              );
            } else {
              return const SizedBox(
                height: kUnselectedIconSize,
                width: kUnselectedIconSize,
              );
            }
          }).toList(),
        );
      },
    );
  }
}
