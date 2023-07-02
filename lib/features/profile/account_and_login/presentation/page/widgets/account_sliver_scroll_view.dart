import 'package:flutter/material.dart';
import '../../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../../const/const.dart';
import '../../../../../../injection_container.dart';
import '../../provider/local_user_provider.dart';

class AccountSliverScrollView extends BodyScrollView {
  const AccountSliverScrollView({
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
          elevation: kAppBarElevation,
          expandedHeight: MediaQuery.of(context).size.height / 7,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            expandedTitleScale: kTitleScale,
          ),
          actions: [
            IconButton(
              onPressed: () {
                getIt.get<LocalUserProvider>().updateUserPhotoUrl();
              },
              icon: const Icon(Icons.add_a_photo_outlined),
            ),
          ],
        ),
        childWidget,
      ],
    );
  }
}
