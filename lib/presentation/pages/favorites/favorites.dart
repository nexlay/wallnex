import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/provider/get_favorites_images_notifier.dart';
import '../../../features/images/domain/entities/wallpaper.dart';
import '../../common/ui/animations/empty_favorites.dart';
import '../../common/ui/animations/loading.dart';
import 'favorites_page.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<GetFavoritesNotifier,
        Tuple3<List<Wallpaper>, bool, String>>(
      selector: (_, provider) =>
          Tuple3(provider.favorites, provider.isLoading, provider.error),
      builder: (_, value, __) =>
          _showBody(context, value.value1, value.value2, value.value3),
    );
  }

  Widget _showBody(BuildContext context, List<Wallpaper> favorites,
      bool isLoading, String error) {
    if (isLoading) {
      return const SliverToBoxAdapter(
        child: Loader(),
      );
    } else if (!isLoading && favorites.isEmpty) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        sliver: const SliverToBoxAdapter(
          child: EmptyFavorites(),
        ),
      );
    } else if (!isLoading && favorites.isNotEmpty) {
      return const FavoritesPage();
    } else {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        sliver: const SliverToBoxAdapter(
          child: EmptyFavorites(),
        ),
      );
    }
  }
}
