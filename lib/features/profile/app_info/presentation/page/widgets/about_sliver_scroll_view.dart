import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../const/const.dart';
import '../../../../../../const/route_paths.dart';

class AboutSliverScrollView extends BodyScrollView {
  const AboutSliverScrollView({
    super.key,
    required super.title,
    required super.childWidget,
  });

  @override
  Widget build(BuildContext context) {
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
          actions: [
            IconButton(
              onPressed: () => context.push(krDiscoverMore),
              icon: const Icon(Icons.more_horiz_outlined),
            ),
          ],
        ),
        SliverPadding(padding: kAppPadding, sliver: childWidget),
      ],
    );
  }
}
