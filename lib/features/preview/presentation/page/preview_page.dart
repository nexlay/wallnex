import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wallnex/features/preview/presentation/page/widgets/viewer.dart';
import 'package:wallnex/features/preview/presentation/provider/set_image_as_wallpaper_notifier.dart';
import '../../../file_manager/presentation/provider/download_provider.dart';
import 'buttons_container.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    final mainColor = Color(
      int.parse(
        wallpaper.colors[1].replaceAll('#', '0xff'),
      ),
    ).computeLuminance();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: mainColor > 0.2 ? Colors.black : Colors.white,
          ),
          onPressed: () {
            context.read<DownloadProvider>().reset();
            context.read<SetImageASWallpaperNotifier>().resetScreenIndex();
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context)!.preview,
          style: TextStyle(
            color: mainColor > 0.2 ? Colors.black : Colors.white,
          ),
        ),
      ),
      body: Hero(
        tag: wallpaper.id,
        child: Stack(
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
            Positioned(
              bottom: 10.0,
              child: PreviewButtons(
                wallpaper: wallpaper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
