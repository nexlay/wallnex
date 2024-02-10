import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallnex/common/ui/pop_up_dialogs/widgets/on_pop_up_specs_menu_item.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';
import '../../../features/images/presentation/provider/get_images_notifier.dart';
import '../loading_status/progess_indicator.dart';

showPopUpMenu({required BuildContext context, required String id}) {
  final locale = L.of(context);
  final loading = context.select((GetImagesNotifier l) => l.isLoading);
  final wallpaper = context.select((GetImagesNotifier w) => w.wallpaper);

  const icons = [
    Icons.photo_size_select_actual_outlined,
    Icons.sd_storage_outlined,
    Icons.remove_red_eye_outlined,
    Icons.info_outline,
    Icons.perm_identity,
    Icons.category_outlined,
    Icons.type_specimen_outlined,
  ];

  final title = [
    locale.resolution,
    locale.size,
    locale.views,
    locale.imageName,
    'id',
    locale.category,
    locale.fileType,
  ];

  final wallpaperData = [
    wallpaper.resolution,
    '${double.parse((wallpaper.size / 1000000).toStringAsFixed(1))}MB',
    wallpaper.views.toString(),
    wallpaper.name,
    wallpaper.id,
    wallpaper.category,
    wallpaper.fileType,
  ];

  return Card(
    child: PopupMenuButton<Widget?>(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      constraints: const BoxConstraints.tightFor(),
      icon: const Icon(Icons.more_horiz),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<OnPopUpSpecsMenuItem>(
          onTap: () => context.read<GetImagesNotifier>().getImageById(id),
          child: loading
              ? const ProgressLoader()
              : Column(
                  children: [
                    Column(
                      children: List<OnPopUpSpecsMenuItem>.generate(
                        icons.length,
                        (index) => OnPopUpSpecsMenuItem(
                            title: Text(wallpaperData[index]),
                            leading: Icon(icons[index]),
                            text: title[index]),
                      ),
                    ),
                    OnPopUpSpecsMenuItem(
                      title: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                style: TextStyle(
                                  color: Colors.blue.withOpacity(0.7),
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
                          ],
                        ),
                      ),
                      leading: const Icon(Icons.upload_file_outlined),
                      text: locale.uploader,
                    ),
                  ],
                ),
        ),
      ],
    ),
  );
}
