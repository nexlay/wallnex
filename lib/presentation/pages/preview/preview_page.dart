import 'package:flutter/material.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/presentation/pages/preview/widgets/preview_buttons_bar.dart';
import 'package:wallnex/presentation/pages/preview/widgets/set_wallpaper_buttons_bar.dart';
import 'package:wallnex/presentation/pages/preview/widgets/viewer.dart';
import '../../../const.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    final mainColor = Color(
      int.parse(
        wallpaper.colors[0].replaceAll('#', '0xff'),
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
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          previewLabel,
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
              width: MediaQuery.of(context).size.width,
              bottom: 10.0,
              child: Card(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: SetWallpaperButtonsBar(),
                    ),
                    PreviewBar(wallpaper: wallpaper),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
