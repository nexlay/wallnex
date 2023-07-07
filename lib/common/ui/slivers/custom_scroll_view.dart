import 'package:flutter/material.dart';
import 'package:wallnex/const/const.dart';
import '../../../../features/images/presentation/page/home/widgets/categories_header.dart';
import '../../../../features/search/presentation/page/search.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';
import '../../../features/ads/presentation/page/banner_ad_widget.dart';

class BodyScrollView extends StatelessWidget {
  const BodyScrollView({
    Key? key,
    required this.title,
    required this.childWidget,
  }) : super(key: key);
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
          elevation: kAppBarElevation,
          expandedHeight: MediaQuery.of(context).size.height / 7,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            expandedTitleScale: kTitleScale,
          ),
        ),
        show ? const CategoriesHeader() : kEmpty,
        show ? const Search() : kEmpty,
        SliverPadding(
          padding: kAppPadding,
          sliver: childWidget,
        ),
        show ? const BannerAdWidget() : kEmpty,
      ],
    );
  }
}
