import 'package:flutter/material.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/profile/dev_info/widgets/social_buttons_bar.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../../profile_list_tile.dart';

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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 60,
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
                    radius: 62,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 60.0,
                      backgroundImage: AssetImage(
                        kDevPhoto,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ProfileListTile(
                    isCenter: false,
                    enabled: false,
                    title: Text(
                      locale.location_description,
                    ),
                    subtitle: Text(
                      locale.location,
                    ),
                    leading: const Icon(Icons.location_on_outlined),
                  ),
                  ProfileListTile(
                    isCenter: false,
                    enabled: false,
                    title: Text(
                      locale.tool_description,
                    ),
                    subtitle: Text(
                      locale.languages_and_tools,
                    ),
                    leading: const Icon(Icons.pan_tool_alt_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
