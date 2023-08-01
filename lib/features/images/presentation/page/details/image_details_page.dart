import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/common/ui/image/image_card.dart';
import 'package:wallnex/common/ui/on_page_item.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/images/presentation/page/details/widgets/deatails_scroll_view.dart';
import '../../../../../common/ui/buttons/favorite_button.dart';
import '../../../../../common/ui/buttons/pop_up_specs_menu.dart';
import '../../../../../const/route_paths.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../../suggestions/presentation/page/suggestions.dart';
import '../../../domain/entities/wallpaper.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return Scaffold(
      body: DetailScrollView(
        title: wallpaper.category,
        childWidget: SliverToBoxAdapter(
          child: Padding(
            padding: kAppPadding,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ImageCard(
                    goTo: () {
                      context.push(krPreview, extra: wallpaper);
                    },
                    path: wallpaper.path,
                    wallpaper: wallpaper,
                    imageSpecs: Positioned(
                      top: 5.0,
                      left: 5.0,
                      child: showPopUpMenu(
                        context: context,
                        id: wallpaper.id,
                      ),
                    ),
                    favorite: Positioned(
                      bottom: 5.0,
                      right: 5.0,
                      child: FavoriteButton(wallpaper: wallpaper),
                    ),
                  ),
                ),
                Padding(
                  padding: kAppPadding,
                  child: OnPageItem(
                    enabled: false,
                    title: Text(
                      locale.suggestions,
                      style: const TextStyle(fontSize: kFontSize),
                    ),
                    subtitle: Text(
                      locale.suggestionsDesc,
                    ),
                  ),
                ),
                const AspectRatio(
                  aspectRatio: 2 / 1,
                  child: Suggestions(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
