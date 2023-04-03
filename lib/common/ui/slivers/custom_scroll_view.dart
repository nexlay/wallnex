import 'package:flutter/material.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/ads/presentation/page/banner_ad_widget.dart';
import '../../../../features/images/presentation/page/home/widgets/categories_header.dart';
import '../../../../features/search/presentation/page/search.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';

class BodyScrollView extends StatelessWidget {
  const BodyScrollView({
    Key? key,
    required this.title,
    required this.childWidget,
    required this.actionWidget,
  }) : super(key: key);
  final String title;

  final Widget childWidget;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    final home = L.of(context).home;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          actions: [
            actionWidget ?? const SizedBox(),
          ],
          elevation: appBarElevation,
          expandedHeight: MediaQuery.of(context).size.height / 7,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            expandedTitleScale: titleScale,
          ),
        ),
        title == home ? const CategoriesHeader() : kEmpty,
        title == home ? const Search() : kEmpty,
        childWidget,
        title == home ? const BannerAdWidget() : kEmpty,
      ],
    );
  }
}
