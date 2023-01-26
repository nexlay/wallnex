import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../const/const_rive.dart';

class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const AspectRatio(
          aspectRatio: 10 / 4,
          child: RiveAnimation.asset(
            emptySuggestions,
            animations: ['lens', 'animate'],
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
              AppLocalizations.of(context)!.imagesNotFound,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
          subtitle: Center(
            child: Text(AppLocalizations.of(context)!.tryToReload),
          ),
        ),
      ],
    );
  }
}
