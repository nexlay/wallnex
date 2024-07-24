import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:wallnex/common/ui/epty_screen/empty_screen.dart';
import 'package:wallnex/common/ui/on_page_list_tile.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';

class EmptySliverScreen extends EmptyScreen {
  const EmptySliverScreen({
    super.key,
    required super.assetPath,
    required super.title,
    required super.subtitle,
    this.showReload,
  });

  final bool? showReload;
  @override
  Widget build(BuildContext context) {
    final l = L.of(context);

    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          AspectRatio(
            aspectRatio: 2 / 1,
            child: RiveAnimation.asset(
              assetPath,
            ),
          ),
          OnPageListTile(
            title: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: kFontSize),
              ),
            ),
            subtitle: Center(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
              ),
            ),
            enabled: false,
          ),
          showReload ?? false
              ? OutlinedButton(
                  onPressed: () {
                    context.read<GetImagesNotifier>().reload();
                  },
                  child: Text(l.reload),
                )
              : Container(),
        ],
      ),
    );
  }
}
