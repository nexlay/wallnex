import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../const/const.dart';
import '../../../../../../const/route_paths.dart';

class DetailScrollView extends BodyScrollView {
  const DetailScrollView(
      {super.key,
      required super.title,
      required super.childWidget,
});

  @override
  Widget build(BuildContext context) {
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
          leading: IconButton(
            onPressed: () => context.go(krRoot),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        childWidget,
      ],
    );
  }
}
