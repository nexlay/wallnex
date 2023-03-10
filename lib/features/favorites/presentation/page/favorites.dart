import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/animations/empty_screen.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';
import '../../../../../common/ui/animations/loading.dart';
import '../../../../const/const_rive.dart';
import '../provider/favorites_images_notifier.dart';
import 'favorites_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<FavoritesNotifier, LocalUser>(
      builder: (_, provider, user, __) => _showBody(context, provider, user),
    );
  }

  Widget _showBody(
      BuildContext context, FavoritesNotifier provider, LocalUser user) {
    if (provider.isLoading) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        sliver: const SliverToBoxAdapter(
          child: Loader(),
        ),
      );
    } else if (!provider.isLoading && provider.favorites.isEmpty) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        sliver: SliverToBoxAdapter(
          child: EmptyScreen(
            assetPath: emptyFavorites,
            title: AppLocalizations.of(context)!.noFavorites,
            subtitle: AppLocalizations.of(context)!.noFavoritesDesc,
          ),
        ),
      );
    } else if (!provider.isLoading && provider.favorites.isNotEmpty) {
      return FavoritesPage(
        favorites: provider.favorites,
      );
    } else {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        sliver: SliverToBoxAdapter(
          child: EmptyScreen(
            assetPath: emptyFavorites,
            title: AppLocalizations.of(context)!.noFavorites,
            subtitle: AppLocalizations.of(context)!.noFavoritesDesc,
          ),
        ),
      );
    }
  }
}
