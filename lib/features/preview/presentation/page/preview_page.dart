import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/image/widgets/image_info.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/preview/presentation/page/widgets/buttons/btn_container.dart';
import 'package:wallnex/features/preview/presentation/page/widgets/buttons/download_btn.dart';
import 'package:wallnex/features/preview/presentation/page/widgets/previewer.dart';
import 'package:wallnex/features/preview/presentation/provider/set_image_as_wallpaper_notifier.dart';
import '../../../../common/ui/buttons/favorite_button.dart';
import '../../../../common/ui/loading_status/set_up_wallpaper_loader.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key, required this.wallpaper});
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    final mainColor = wallpaper.colors.isNotEmpty &&
            wallpaper.colors.length > 1 // Check for enough elements
        ? Color(int.parse(wallpaper.colors[1].replaceAll('#', '0xff')))
            .computeLuminance()
        : Colors.grey
            .computeLuminance(); // Default to grey's luminance if the list is insufficient
    return Scaffold(
      floatingActionButton: SetUpBtn(
        wallpaper: wallpaper,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //floatingActionButtonAnimator: FloatingActionButtonAnimator,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: mainColor > 0.2 ? Colors.black : Colors.white,
          ),
          onPressed: () {
            context.read<SetImageASWallpaperNotifier>().value = 0;
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          L.of(context).preview,
          style: TextStyle(
            color: mainColor > 0.2 ? Colors.black : Colors.white,
          ),
        ),
      ),
      body: Hero(
        tag: wallpaper.id,
        child: Selector<SetImageASWallpaperNotifier, bool>(
          selector: (_, provider) => provider.loading,
          builder: (_, loader, __) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: PreviewViewer(
                    wallpaper: wallpaper,
                  ),
                ),
              ),
              loader ? const LoadingWhenWallpaperSetUp() : const SizedBox(),
              Positioned(
                bottom: 100,
                right: 0,
                child: Column(
                  children: [
                    FavoriteButton(
                      wallpaper: wallpaper,
                      showCircleAvatar: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: DownloadBtn(
                        wallpaper: wallpaper,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                bottom: 100,
                left: 0,
                child: ImageInformation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
