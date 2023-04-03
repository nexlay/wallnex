import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';

import '../../../../../common/ui/animations/empty_sliver_screen.dart';
import '../../../../../common/ui/animations/loading.dart';
import '../../../../../const/const_rive.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';
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
    final locale = L.of(context);
    final emptyScreen = EmptySliverScreen(
      assetPath: kEmptySuggestions,
      title: locale.imagesNotFound,
      subtitle: locale.tryToReload,
    );

    return isLoading
        ? const SliverFillRemaining(
            child: Loader(),
          )
        : !isLoading && list.isEmpty
            ? emptyScreen
            : !isLoading && list.isNotEmpty
                ? const HomePage()
                : emptyScreen;
  }
}
