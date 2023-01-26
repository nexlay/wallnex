import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../../const/const_rive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const AspectRatio(
          aspectRatio: 8 / 4,
          child: RiveAnimation.asset(
            emptyFavorites,
            animations: [
              'image',
              'animate',
            ],
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
              AppLocalizations.of(context)!.noFavorites,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
          subtitle: Center(
            child: Text(AppLocalizations.of(context)!.noFavoritesDesc),
          ),
        ),
      ],
    );
  }
}
