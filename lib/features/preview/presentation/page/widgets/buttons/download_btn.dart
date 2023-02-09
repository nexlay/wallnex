import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../../common/ui/dialogs/allert_dialog.dart';
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
    return ScaleTransition(
      scale: _controller,
      child: Consumer<DownloadProvider>(
        builder: (_, provider, __) =>
            Selector<GetPermissionNotifier, AppPermissionsStatus>(
          selector: (_, provider) => provider.value,
          builder: (_, value, __) => IconButton(
            onPressed: () {
              switch (value) {
                case AppPermissionsStatus.granted:
                  context
                      .read<DownloadProvider>()
                      .createEnqueue(widget.wallpaper.path);
                  _animate();
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
            icon: provider.value == 100
                ? const Icon(Icons.check_circle, color: Colors.green,)
                : const Icon(Icons.arrow_circle_down),
          ),
        ),
      ),
    );
  }
}
