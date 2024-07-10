import 'package:flutter/material.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/sorting/presentation/page/sorting_images_premium_only.dart';
import '../../../../features/search/presentation/page/search.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';
import '../../../features/ads/presentation/page/banner_ad_widget.dart';

class BodyScrollView extends StatelessWidget {
  const BodyScrollView({
    super.key,
    required this.title,
    required this.childWidget,
  });
  final String title;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    final home = L.of(context).home;
    final show = title == home;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: kDefaultValue,
          expandedHeight: MediaQuery.of(context).size.height / 7,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            expandedTitleScale: kTitleScale,
          ),
        ),
        SliverVisibility(
          visible: show,
          sliver: const SortingImages(),
        ),
        SliverVisibility(
          visible: show,
          sliver: const Search(),
        ),
        SliverPadding(
          padding: kAppPadding,
          sliver: childWidget,
        ),
        SliverVisibility(
          visible: show,
          sliver: const SliverPadding(
            padding: kAppPadding,
            sliver: BannerAdWidget(),
          ),
        ),
      ],
    );
  }
}
