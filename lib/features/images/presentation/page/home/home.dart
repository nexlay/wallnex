import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../common/ui/animations/empty_screen.dart';
import '../../../../../common/ui/animations/loading.dart';
import '../../../../../const/const_rive.dart';
import 'home_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images =
        context.select((GetImagesNotifier provider) => provider.imageList);
    final isLoading =
        context.select((GetImagesNotifier provider) => provider.isLoading);
    return _showBody(
      context,
      images,
      isLoading,
    );
  }

  Widget _showBody(
    BuildContext context,
    List<Wallpaper> list,
    bool isLoading,
  ) {
    final locale = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size.height / 6;

    if (isLoading) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(vertical: size),
        sliver: const SliverToBoxAdapter(
          child: Loader(),
        ),
      );
    } else if (!isLoading && list.isNotEmpty) {
      return const HomePage();
    } else {
      return SliverPadding(
        padding: EdgeInsets.symmetric(vertical: size),
        sliver: SliverToBoxAdapter(
          child: EmptyScreen(
            assetPath: emptySuggestions,
            title: locale.imagesNotFound,
            subtitle: locale.tryToReload,
          ),
        ),
      );
    }
  }
}
