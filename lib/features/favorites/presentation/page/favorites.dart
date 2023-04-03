import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../common/ui/animations/loading.dart';
import '../../../../common/ui/animations/empty_sliver_screen.dart';
import '../../../../const/const_rive.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../provider/favorites_images_notifier.dart';
import 'favorites_page.dart';


class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesNotifier>(
      builder: (_, provider, __) => _showBody(
        context,
        provider,
      ),
    );
  }

  Widget _showBody(BuildContext context, FavoritesNotifier provider) {
    final locale = L.of(context);
    final emptyScreen = EmptySliverScreen(
      assetPath: kEmptyFavorites,
      title: locale.noFavorites,
      subtitle: locale.noFavoritesDesc,
    );

    return provider.isLoading
        ? const SliverFillRemaining(
            child: Loader(),
          )
        : !provider.isLoading && provider.favorites.isEmpty
            ? emptyScreen
            : !provider.isLoading && provider.favorites.isNotEmpty
                ? FavoritesPage(
                    favorites: provider.favorites,
                  )
                : emptyScreen;
  }
}
