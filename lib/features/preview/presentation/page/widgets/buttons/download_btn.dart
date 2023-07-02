import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../../common/ui/dialogs/allert_dialog.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../../../file_manager/presentation/provider/download_provider.dart';
import '../../../../../permissions/presentation/provider/get_permission_status_notifier.dart';

class DownloadBtn extends StatefulWidget {
  const DownloadBtn({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;
  @override
  State<DownloadBtn> createState() => _DownloadCompleteBtnState();
}

class _DownloadCompleteBtnState extends State<DownloadBtn>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.3,
    );
    super.initState();
  }

  void _animate() {
    _controller.forward().then((value) => _controller.reverse());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final permissions = context.watch<GetPermissionNotifier>();
    final download = context.watch<DownloadProvider>();
    final locale = L.of(context);
    return ScaleTransition(
      scale: _controller,
      child: Card(
        child: IconButton(
          onPressed: () {
            switch (permissions.value.value2) {
              case AppPermissionsStatus.granted:
                download
                  ..createEnqueue(widget.wallpaper.path)
                  ..resetDownloadStatus();
                _animate();
                break;
              case AppPermissionsStatus.denied:
                permissions.getPermissionStatus();
                break;
              case AppPermissionsStatus.permanentlyDenied:
                showMyDialog(
                  context,
                  permissions.value.value1 == AppPermissions.notifications
                      ? locale.notificationPermission
                      : locale.storagePermission,
                  locale.permissionDesc,
                  locale.settings,
                  locale.exit,
                );
                break;
              case AppPermissionsStatus.restricted:
                //TODO: Restricted permission action
                break;
              case AppPermissionsStatus.limited:
                //TODO: Limited permission action
                break;
            }
          },
          icon: download.value == 100
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )
              : const Icon(Icons.arrow_circle_down),
        ),
      ),
    );
  }
}
