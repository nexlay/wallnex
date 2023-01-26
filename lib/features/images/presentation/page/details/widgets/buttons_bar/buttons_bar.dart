import 'package:flutter/material.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../common/ui/buttons/favorite_button.dart';
import '../../../../../../preview/presentation/page/preview_page.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({
    Key? key,
    required this.wallpaper,
  }) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PreviewPage(
                  wallpaper: wallpaper,
                ),
              ),
            );
          },
          child: Text(AppLocalizations.of(context)!.preview),
        ),
        FavoriteButton(wallpaper: wallpaper),
      ],
    );
  }
}
