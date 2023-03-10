import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wallnex/features/preview/presentation/page/widgets/btn_container.dart';
import 'package:wallnex/features/preview/presentation/page/widgets/previewer.dart';
import 'package:wallnex/features/preview/presentation/provider/set_image_as_wallpaper_notifier.dart';
import '../../../../common/ui/animations/loading.dart';

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
            context.read<SetImageASWallpaperNotifier>().value = 0;
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
              Positioned(
                left: 5.0,
                bottom: 10.0,
                child: BtnContainer(
                  wallpaper: wallpaper,
                ),
              ),
              loader ? const Loader() : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
