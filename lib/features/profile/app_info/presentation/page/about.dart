import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/spacer.dart';
import 'package:wallnex/features/profile/app_info/presentation/page/widgets/social_buttons_bar.dart';
import 'package:wallnex/features/profile/widgets/account_item.dart';
import '../../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../../common/ui/slivers/custom_scroll_view.dart';
import '../../../../../const/const.dart';
import '../../../../../const/const_rive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../provider/get_app_info_notifier.dart';

class AppInformation extends StatelessWidget {
  const AppInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: BodyScrollView(
        title: locale.appInfo,
        actionWidget: IconButton(
          onPressed: () => context.push(discoverMore),
          icon: const Icon(Icons.more_horiz_outlined),
        ),
        childWidget: SliverToBoxAdapter(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              showSpacer(height: MediaQuery.of(context).size.height / 12),
              Selector<GetAppInfoNotifier, Tuple3<String, String, String>>(
                selector: (_, provider) =>
                    Tuple3(provider.appName, provider.version, provider.appBuild),
                builder: (_, value, __) {
                  return Column(
                    children: [
                      const AnimationWithRive(
                        path: logo,
                      ),
                      showSpacer(height: 15.0),
                      Text(
                        value.value1,
                        style: const TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ${locale.version}: ${value.value2}.${value.value3}-alpha',
                        style:
                            const TextStyle(color: Colors.grey,),
                      ),
                      showSpacer(height: MediaQuery.of(context).size.height / 4),
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
                        style:
                            const TextStyle(color: Colors.grey,),
                      ),
                    ),
                    path: devInfo,
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