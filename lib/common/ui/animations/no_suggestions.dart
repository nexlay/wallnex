import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../../../../const/const_rive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptySuggestions extends StatelessWidget {
  const EmptySuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const AspectRatio(
          aspectRatio: 3 / 1,
          child: RiveAnimation.asset(
            emptySuggestions,
            animations: ['lens', 'animate'],
          ),
        ),
        ListTile(
          title: Center(
            child: Text(
              AppLocalizations.of(context)!.noSuggestions,
              style: const TextStyle(fontSize: 22.0),
            ),
          ),
          subtitle: Center(
              child: Text(AppLocalizations.of(context)!.noSuggestionsDesc)),
        ),
      ],
    );
  }
}
