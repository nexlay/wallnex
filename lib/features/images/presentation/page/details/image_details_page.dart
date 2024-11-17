import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/common/ui/image/image_card.dart';
import 'package:wallnex/common/ui/image/widgets/image_colors.dart';
import 'package:wallnex/common/ui/on_page_list_tile.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/images/presentation/page/details/widgets/deatails_scroll_view.dart';
import '../../../../../const/route_paths.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../../suggestions/presentation/page/suggestions.dart';
import '../../../domain/entities/wallpaper.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({super.key, required this.wallpaper});
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);

    return Scaffold(
      body: DetailScrollView(
        title: wallpaper.name,
        childWidget: SliverToBoxAdapter(
          child: Padding(
            padding: kAppPadding,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ImageCard(
                    goTo: () {
                      context.push(krPreview, extra: wallpaper);
                    },
                    path: wallpaper.path,
                    wallpaper: wallpaper,
                    showImageSpecsBtn: true,
                    showFavoriteBtn: true,
                    showSendBtn: false,
                  ),
                ),
                Padding(
                  padding: kAppPadding,
                  child: OnPageListTile(
                    enabled: false,
                    title: Text(
                      locale.usedColors,
                      style: TextStyle(fontSize: kFontSizeMid),
                    ),
                    subtitle: Text(
                      locale.usedColorsDesc,
                    ),
                  ),
                ),
                ImageColors(wallpaper: wallpaper),
                Padding(
                  padding: kAppPadding,
                  child: OnPageListTile(
                    enabled: false,
                    title: Text(
                      locale.suggestions,
                      style: const TextStyle(fontSize: kFontSizeMid),
                    ),
                    subtitle: Text(
                      locale.suggestionsDesc,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / kAppSize,
                  child: const Suggestions(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
