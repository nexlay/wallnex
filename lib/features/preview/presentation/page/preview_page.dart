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
import 'package:wallnex/features/file_manager/presentation/provider/download_provider.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key, required this.wallpaper});
  final Wallpaper wallpaper;

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DownloadProvider>().resetDownloadStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Default to grey's luminance if the list is insufficient
    return Scaffold(
      floatingActionButton: SetUpBtn(
        wallpaper: widget.wallpaper,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //floatingActionButtonAnimator: FloatingActionButtonAnimator,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            context.read<SetImageASWallpaperNotifier>().value = 0;
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Hero(
        tag: widget.wallpaper.id,
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
                    wallpaper: widget.wallpaper,
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
                      wallpaper: widget.wallpaper,
                      showCircleAvatar: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: DownloadBtn(
                        wallpaper: widget.wallpaper,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                top: 100,
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
