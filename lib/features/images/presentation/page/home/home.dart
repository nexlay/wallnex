import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/loading_status/progess_indicator.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import '../../../../../common/ui/epty_screen/empty_sliver_screen.dart';
import '../../../../../const/const_rive.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';
import 'home_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final imagesNotifier = Provider.of<GetImagesNotifier>(context);
    final images = imagesNotifier.imageList;
    final isLoading = imagesNotifier.isLoading;

    return _buildBody(context, images, isLoading);
  }

  Widget _buildBody(
    BuildContext context,
    List<Wallpaper> images,
    bool isLoading,
  ) {
    final locale = L.of(context);
    final emptyScreen = EmptySliverScreen(
      assetPath: kEmptySuggestions,
      title: locale.imagesNotFound,
      subtitle: locale.tryToReload,
      showReload: true,
    );

    if (isLoading) {
      return const SliverFillRemaining(child: ProgressLoader());
    } else if (images.isEmpty) {
      return emptyScreen;
    } else {
      return const HomePage();
    }
  }
}
