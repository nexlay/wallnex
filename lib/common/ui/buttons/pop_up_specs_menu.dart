import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallnex/common/ui/buttons/widgets/on_pop_up_specs_menu_item.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';
import '../../../features/images/presentation/provider/get_images_notifier.dart';
import '../loading_status/progess_indicator.dart';
import '../image/image_specs/image_colors.dart';
import '../image/image_specs/image_specs_bar.dart';
import '../spacer.dart';

showPopUpMenu({required BuildContext context, required String id}) {
  final locale = L.of(context);
  final loading = context.select((GetImagesNotifier l) => l.isLoading);
  final wallpaper = context.select((GetImagesNotifier w) => w.wallpaper);
  return Card(
    child: PopupMenuButton<Widget?>(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      constraints: const BoxConstraints.tightFor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      icon: const Icon(Icons.more_horiz),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<Widget?>(
          onTap: () => context.read<GetImagesNotifier>().getImageById(id),
          child: loading
              ? const ProgressLoader()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      OnPopUpSpecsMenuItem(
                        title: Text(
                          wallpaper.name,
                        ),
                        subtitle: const SizedBox(),
                        path: '',
                        leading: const Icon(Icons.info),
                        text: locale.imageName,
                      ),
                      OnPopUpSpecsMenuItem(
                        title: Text(
                          wallpaper.id,
                        ),
                        subtitle: const SizedBox(),
                        path: '',
                        leading: const Icon(Icons.perm_identity),
                        text: 'id',
                      ),
                      OnPopUpSpecsMenuItem(
                        title: Text(
                          wallpaper.category,
                        ),
                        subtitle: const SizedBox(),
                        path: '',
                        leading: const Icon(Icons.category),
                        text: locale.category,
                      ),
                      OnPopUpSpecsMenuItem(
                        title: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: Colors.redAccent.withOpacity(0.5),
                                  ),
                                  text: wallpaper.uploaderName,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      if (!await launchUrl(
                                        Uri.parse(wallpaper.shortUrl),
                                      )) {
                                        throw 'Could not launch ${wallpaper.shortUrl}';
                                      }
                                    }),

                              //more text paragraph, sentences here.
                            ],
                          ),
                        ),
                        subtitle: const SizedBox(),
                        path: '',
                        leading: const Icon(Icons.upload),
                        text: locale.uploader,
                      ),
                      OnPopUpSpecsMenuItem(
                        title: Text(
                          wallpaper.fileType,
                        ),
                        subtitle: const SizedBox(),
                        path: '',
                        leading: const Icon(Icons.type_specimen),
                        text: locale.fileType,
                      ),
                      showSpacer(height: 50.0, width: 0.0),
                      ImageSpecsBar(
                        size: wallpaper.size,
                        views: wallpaper.views,
                        resolution: wallpaper.resolution,
                        fontSize: 14.0,
                        iconSize: 16.0,
                      ),
                      showSpacer(height: 10.0, width: 0.0),
                      ImageColors(
                        list: wallpaper.colors,
                      ),
                    ],
                  ),
                ),
        ),
      ],
    ),
  );
}
