import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../const/const.dart';
import '../../../../features/suggestions/presentation/provider/get_suggestions_notifier.dart';

class ImageColors extends StatelessWidget {
  const ImageColors({super.key, required this.wallpaper});
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: wallpaper.colors.map((dynamic colorHex) {
        if (colorHex is String && colorHex.isNotEmpty) {
          final color = Color(int.parse(colorHex.replaceFirst('#', '0xff')));
          return InkWell(
            borderRadius: BorderRadius.circular(
                kUnselectedIconSize / 2), // Set borderRadius for InkWell
            onTap: () {
              context
                  .read<GetSuggestionsNotifier>()
                  .getSuggestionsByColorUseCase(ParamsMultiString(
                      params: colorHex.replaceFirst('#', ''),
                      params1: wallpaper.id));
            },
            child: Card(
              elevation: kAppSize,
              color: color,
              child: const SizedBox(
                height: kUnselectedIconSize,
                width: kUnselectedIconSize,
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
  }
}
