import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/pages/home_page/widgets/if_loaded.dart';
import 'package:wallnex/presentation/provider/get_wallpapers_notifier.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _showBody(context);
  }

  Widget _showBody(BuildContext context) {
    // **  Run your code after the widget has finished building.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetWallpapersNotifier>().loadAllWallpapers();
    });

    final isLoading = context.select((GetWallpapersNotifier n) => n.isLoading);
    //TODO: Errors
    final error = context.select((GetWallpapersNotifier n) => n.error);
    final list = context.select((GetWallpapersNotifier n) => n.charactersList);

    if (isLoading) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (!isLoading && list.isNotEmpty) {
      return IsLoaded(wallpapersList: list);
    } else {
      //TODO: Make Empty container when no list loaded
      return SliverToBoxAdapter(child: Container(),);
    }
  }
}
