import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../const/const.dart';
import '../../../../../../const/route_paths.dart';

class DetailScrollView extends BodyScrollView {
  const DetailScrollView(
      {super.key,
      required super.childWidget, required super.title,
});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          elevation: kDefaultValue,
          pinned: true,
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
