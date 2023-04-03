import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/profile/app_info/presentation/page/widgets/social_buttons_bar.dart';
import 'package:wallnex/features/profile/widgets/account_item.dart';
import '../../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../const/const.dart';
import '../../../../../const/const_rive.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';
import '../provider/get_app_info_notifier.dart';

class AppInformation extends StatelessWidget {
  const AppInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return Scaffold(
      body: BodyScrollView(
        title: locale.appInfo,
        actionWidget: IconButton(
          onPressed: () => context.push(krDiscoverMore),
          icon: const Icon(Icons.more_horiz_outlined),
        ),
        childWidget: SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Selector<GetAppInfoNotifier, Tuple3<String, String, String>>(
                selector: (_, provider) => Tuple3(
                    provider.appName, provider.version, provider.appBuild),
                builder: (_, value, __) {
                  return Column(
                    children: [
                      const AnimationWithRive(
                        path: kLogo, onRiveInit: null,
                      ),
                      Text(
                        value.value1,
                        style: const TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ${locale.version}: ${value.value2}.${value.value3}-alpha',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
              ),
              Column(
                children: [
                  AccountItem(
                    title: Center(
                      child: Text(
                        locale.madeBy,
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        locale.developer_email,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    path: krDevInfo,
                    trailing: null,
                    leading: null,
                  ),
                  const SocialButtonsBar(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
