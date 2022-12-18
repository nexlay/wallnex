import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/common/animations/loading.dart';
import 'package:wallnex/presentation/pages/home_page/widgets/when_loaded.dart';
import 'package:wallnex/presentation/provider/get_wallpapers_from_api_notifier.dart';
import '../../common/animations/empty_home_screen.dart';

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




    if (isLoading) {
      return  SliverPadding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/6),
        sliver: SliverToBoxAdapter(
          child: Loader(),
        ),
      );
    } else if (!isLoading && list.isNotEmpty) {
      return const WhenLoaded();
    } else {
      return const SliverToBoxAdapter(
        child: EmptyHomeScreen(),
      );
    }
  }
}
