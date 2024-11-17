import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallnex/const/const.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../../features/images/presentation/provider/get_images_notifier.dart';
import '../../loading_status/progess_indicator.dart';

class ImageInformation extends StatelessWidget {
  const ImageInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    final loading = context.select((GetImagesNotifier l) => l.isLoading);
    final wallpaper = context.select((GetImagesNotifier w) => w.wallpaper);

    return Padding(
      padding: kAppPadding,
      child: loading
          ? const ProgressLoader()
          : RichText(
              text: TextSpan(
                text: '',
                children: [
                  TextSpan(
                      text: '@${wallpaper.uploaderName}\n\n',
                      style: const TextStyle(fontSize: kFontSizeBig),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (!await launchUrl(
                            Uri.parse(wallpaper.shortUrl),
                          )) {
                            throw 'Could not launch ${wallpaper.shortUrl}';
                          }
                        }),
                  TextSpan(
                    text: '${wallpaper.name}\n',
                    style: const TextStyle(
                        fontSize: kFontSizeMid, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        '${double.parse((wallpaper.size / 1000000).toStringAsFixed(1))} MB | ${wallpaper.views.toString()} ${locale.views} | ${wallpaper.resolution}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
    );
  }
}
