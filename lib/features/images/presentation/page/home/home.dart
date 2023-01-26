import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import '../../../../../common/ui/animations/empty_home_screen.dart';
import '../../../../../common/ui/animations/loading.dart';
import 'home_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<GetImagesNotifier,
        Tuple3<List<Wallpaper>, bool, String>>(
      selector: (_, provider) =>
          Tuple3(provider.imageList, provider.isLoading, provider.error),
      builder: (_, value, __) =>
          _showBody(context, value.value1, value.value2, value.value3),
    );
  }

  Widget _showBody(BuildContext context, List<Wallpaper> list, bool isLoading,
      String error) {
    if (isLoading) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        sliver: const SliverToBoxAdapter(
          child: Loader(),
        ),
      );
    } else if (!isLoading && list.isNotEmpty) {
      return const HomePage();
    } else {
      return SliverPadding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6),
        sliver: const SliverToBoxAdapter(
          child: EmptyHomeScreen(),
        ),
      );
    }
  }
}
