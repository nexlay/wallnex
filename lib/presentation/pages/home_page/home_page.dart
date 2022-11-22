import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/pages/home_page/widgets/when_loaded.dart';
import 'package:wallnex/presentation/provider/get_favorites_wallpapers_notifier.dart';
import 'package:wallnex/presentation/provider/get_wallpapers_from_api_notifier.dart';

class WallnexHomePage extends StatelessWidget {
  const WallnexHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _showBody(context);
  }

  Widget _showBody(BuildContext context) {
    final isLoading = context.select((GetWallpapersNotifier n) => n.isLoading);
    //TODO: Errors
    final error = context.select((GetWallpapersNotifier n) => n.error);
    final list = context.select((GetWallpapersNotifier n) => n.imageList);
    final isOpened = context.select((GetFavoritesNotifier f) => f.isOpened);

    // **  Run your code after the widget has finished building.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetWallpapersNotifier>().loadAllWallpapers();

      if (isOpened == false) {
        context.read<GetFavoritesNotifier>().openDatabase();
      }
    });

    if (isLoading) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (!isLoading && list.isNotEmpty) {
      return WhenLoaded(wallpapersList: list);
    } else {
      //TODO: Make Empty container when no list loaded
      return SliverToBoxAdapter(
        child: Container(),
      );
    }
  }
}
