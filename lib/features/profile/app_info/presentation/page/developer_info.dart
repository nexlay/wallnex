import 'package:flutter/material.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/profile/app_info/presentation/page/widgets/social_buttons_bar.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../profile_list_tile.dart';

class DeveloperInfo extends StatelessWidget {
  const DeveloperInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return Scaffold(
      body: BodyScrollView(
        title: locale.contact,
        childWidget: SliverFillRemaining(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Card(
                        elevation: 0.5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            ProfileListTile(
                              isCenter: true,
                              enabled: false,
                              title: Text(
                                locale.madeBy,
                              ),
                              subtitle: Text(
                                locale.developer_email,
                              ),
                            ),
                            const SocialButtonsBar(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 52,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50.0,
                      backgroundImage: AssetImage(
                        kDevPhoto,
                      ),
                    ),
                  ),
                ],
              ),
              ProfileListTile(
                isCenter: false,
                enabled: false,
                title: Text(
                  locale.location,
                ),
                subtitle: Text(
                  locale.location_description,
                ),
                leading: const Icon(Icons.location_on_outlined),
              ),
              ProfileListTile(
                isCenter: false,
                enabled: false,
                title: Text(
                  locale.languages_and_tools,
                ),
                subtitle: Text(
                  locale.tool_description,
                ),
                leading: const Icon(Icons.pan_tool_alt_outlined),
              ),
              ProfileListTile(
                isCenter: false,
                enabled: false,
                title: Text(
                  locale.fun_fact,
                ),
                subtitle: Text(
                  locale.fun_fact_description,
                ),
                leading: const Icon(Icons.fact_check_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
