import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/common/animations/loading.dart';
import 'package:wallnex/presentation/pages/favorites_page/widgets/when_favorites_loaded.dart';
import 'package:wallnex/presentation/provider/get_favorites_wallpapers_notifier.dart';
import '../../common/animations/empty_favorites.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _showBody(context);
  }

  Widget _showBody(BuildContext context) {
    final isLoading = context.select((GetFavoritesNotifier n) => n.isLoading);
    //TODO: Errors
    final error = context.select((GetFavoritesNotifier n) => n.error);
    final favorites = context.select((GetFavoritesNotifier n) => n.favorites);
    // **  Run your code after the widget has finished building.
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        context.read<GetFavoritesNotifier>().loadFavoritesWallpapers();
      },
    );


    if (isLoading) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Loader(),
        ),
      );
    } else if (!isLoading && favorites.isEmpty) {
      return const SliverToBoxAdapter(
        child: EmptyFavorites(),
      );
    } else if (!isLoading && favorites.isNotEmpty) {
      return const WhenFavoritesLoaded();
    } else {
      return const SliverToBoxAdapter(
        child: EmptyFavorites(),
      );
    }
  }
}
