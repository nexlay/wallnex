import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../../../common/ui/buttons/favorite_button.dart';
import '../../../../../../../core/config/l10n/generated/app_localizations.dart';

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
            context.push(krPreview, extra: wallpaper);
          },
          child: Text(L.of(context).preview),
        ),
        FavoriteButton(wallpaper: wallpaper),
      ],
    );
  }
}
