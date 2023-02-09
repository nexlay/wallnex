import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/animations/empty_screen.dart';
import '../../../../../common/ui/animations/loading.dart';
import '../../../../const/const_rive.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../provider/favorites_images_notifier.dart';
import 'favorites_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetFavoritesNotifier>(
      builder: (_, provider, __) => _showBody(
          context, provider.favorites, provider.isLoading, provider.error),
    );
  }

  Widget _showBody(BuildContext context, List<Wallpaper> favorites,
      bool isLoading, String error) {
    if (isLoading) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        sliver: const SliverToBoxAdapter(
          child: Loader(),
        ),
      );
    } else if (!isLoading && favorites.isEmpty) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        sliver: SliverToBoxAdapter(
          child: EmptyScreen(
            animations: const ['image', 'animate'],
            assetPath: emptyFavorites,
            title: AppLocalizations.of(context)!.noFavorites,
            subtitle: AppLocalizations.of(context)!.noFavoritesDesc,
          ),
        ),
      );
    } else if (!isLoading && favorites.isNotEmpty) {
      return const FavoritesPage();
    } else {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        sliver: SliverToBoxAdapter(
          child: EmptyScreen(
            animations: const ['image', 'animate'],
            assetPath: emptyFavorites,
            title: AppLocalizations.of(context)!.noFavorites,
            subtitle: AppLocalizations.of(context)!.noFavoritesDesc,
          ),
        ),
      );
    }
  }
}
