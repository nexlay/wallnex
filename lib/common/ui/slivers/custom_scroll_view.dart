import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/ads/presentation/page/banner_ad_widget.dart';
import '../../../../features/images/presentation/page/home/widgets/categories_header.dart';
import '../../../../features/search/presentation/page/search.dart';

const appBarElevation = 0.0;
const titleScale = 1.5;

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
    final home = AppLocalizations.of(context)!.home;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          actions: [
            actionWidget == null ? const SizedBox() : actionWidget!,
          ],
          elevation: appBarElevation,
          expandedHeight: MediaQuery.of(context).size.height / 7,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            expandedTitleScale: titleScale,
          ),
        ),
        title == home ? const CategoriesHeader() : empty,
        title == home ? const Search() : empty,
        childWidget,
        title == home ? const BannerAdWidget() : empty,
      ],
    );
  }
}
