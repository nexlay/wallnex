import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const_rive.dart';
import 'package:wallnex/features/profile/app_info/presentation/page/widgets/about_sliver_scroll_view.dart';
import 'package:wallnex/features/profile/profile_list_tile.dart';
import '../../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';
import '../provider/get_app_info_notifier.dart';

class AppInformation extends StatelessWidget {
  const AppInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return Scaffold(
      body: AboutSliverScrollView(
        title: locale.appInfo,
        childWidget: Consumer<GetAppInfoNotifier>(
          // Use Consumer for more targeted rebuilds
          builder: (_, provider, __) {
            final appName = provider.appName;
            final version = provider.version;
            final buildNumber = provider.appBuild;

            return SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const AnimationWithRive(path: kWallnex),
                  ProfileListTile(
                    isCenter: true,
                    enabled: false,
                    title: Text(
                      appName, // Directly use variables for clarity
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${locale.version}: $version.$buildNumber-alpha', // Simplified string interpolation
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
