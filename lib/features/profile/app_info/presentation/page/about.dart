import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/profile/app_info/presentation/page/widgets/about_sliver_scroll_view.dart';
import 'package:wallnex/features/profile/profile_list_tile.dart';
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
        childWidget: SliverToBoxAdapter(
          child: Selector<GetAppInfoNotifier, Tuple3<String, String, String>>(
            selector: (_, provider) =>
                Tuple3(provider.appName, provider.version, provider.appBuild),
            builder: (_, value, __) {
              return Card(
                elevation: 0.1,
                child: ProfileListTile(
                  isCenter: true,
                  enabled: false,
                  title: Text(
                    value.value1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    ' ${locale.version}: ${value.value2}.${value.value3}-alpha',
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
