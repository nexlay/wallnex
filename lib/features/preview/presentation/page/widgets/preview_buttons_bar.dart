import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/file_manager/presentation/provider/download_provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../../common/ui/buttons/favorite_button.dart';
import '../../../../../../common/ui/modal_bottom_sheet/show_bottom_sheet.dart';
import '../../../../../common/ui/dialogs/allert_dialog.dart';
import '../../../../../core/permissions/presentation/provider/get_permission_status_notifier.dart';
import '../../../../images/presentation/page/details/widgets/image_specs/image_specs_menu.dart';
import '../../../../images/presentation/provider/get_images_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:badges/badges.dart';

class PreviewBar extends StatefulWidget {
  const PreviewBar({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  State<PreviewBar> createState() => _PreviewBarState();
}

class _PreviewBarState extends State<PreviewBar> {
  @override
  Widget build(BuildContext context) {
    final permission = context.select((GetPermissionNotifier p) => p.value);
    return ButtonBar(
      children: [
        FavoriteButton(
          wallpaper: widget.wallpaper,
        ),
        IconButton(
          onPressed: () {
            context.read<GetImagesNotifier>().getImageById(widget.wallpaper.id);
            showBottomMenu(
              context,
              const ImageSpecsDialog(),
            );
          },
          icon: const Icon(
            Icons.info_outline,
          ),
        ),
        Consumer<DownloadProvider>(
          builder: (_, provider, __) => Badge(
            showBadge: provider.downloadProgress > 1 ? true : false,
            badgeColor:
                provider.downloadProgress == 100 ? Colors.green : Colors.red,
            shape: BadgeShape.square,
            borderRadius: BorderRadius.circular(16.0),
            badgeContent: provider.downloadProgress == 100
                ? const Icon(
                    Icons.check,
                    size: 9,
                  )
                : const Icon(
                    Icons.error,
                    size: 9,
                  ),
            animationType: BadgeAnimationType.scale,
            child: IconButton(
              onPressed: () {
                switch (permission) {
                  case AppPermissionsStatus.granted:
                    provider.createEnqueue(widget.wallpaper.path);
                    provider.registerIsolate();

                    break;
                  case AppPermissionsStatus.denied:
                    context.read<GetPermissionNotifier>().getPermissionStatus();
                    break;
                  case AppPermissionsStatus.permanentlyDenied:
                    showMyDialog(
                      context,
                      AppLocalizations.of(context)!.storagePermission,
                      AppLocalizations.of(context)!.storagePermDesc,
                      AppLocalizations.of(context)!.settings,
                      AppLocalizations.of(context)!.exit,
                    );
                    break;
                  case AppPermissionsStatus.restricted:
                    //TODO: Restricted permission action
                    break;
                  case AppPermissionsStatus.limited:
                    //TODO: Limited permission action
                    break;
                  case AppPermissionsStatus.unknown:
                    context.read<GetPermissionNotifier>().getPermissionStatus();
                    break;
                }
              },
              icon: const Icon(
                Icons.arrow_circle_down,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
