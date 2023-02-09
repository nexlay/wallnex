import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../features/images/presentation/page/home/widgets/categories_header.dart';
import '../../../../features/search/presentation/page/search.dart';
import '../buttons/floating_page_buttons_bar.dart';

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
    String home = AppLocalizations.of(context)!.home;
    return Scaffold(
      floatingActionButton:
          title == home ? const FloatingButtonsBar() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
             actions: [
              actionWidget == null ? const SizedBox() : actionWidget!,
            ],
            elevation: 0.0,
            expandedHeight: MediaQuery.of(context).size.height / 7,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title),
              expandedTitleScale: 1.5,
            ),
          ),
          title == home
              ? const CategoriesHeader()
              : const SliverToBoxAdapter(),
          title == home
              ? const Search()
              : const SliverToBoxAdapter(),
          childWidget,
        ],
      ),
    );
  }
}
