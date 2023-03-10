import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/features/profile/app_info/presentation/page/widgets/social_buttons_bar.dart';
import '../../../../../../common/ui/spacer.dart';
import '../../../../widgets/account_item.dart';

const itemTextStyle = TextStyle(
  color: Colors.grey,
);

const assetPath = 'assets/image/dev/developer.jpg';

class DeveloperInfo extends StatelessWidget {
  const DeveloperInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: BodyScrollView(
        title: locale.contact,
        actionWidget: null,
        childWidget: SliverToBoxAdapter(
          child: Column(
            children: [
              showSpacer(height: MediaQuery.of(context).size.height / 12),
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40.0,
                backgroundImage: AssetImage(
                  assetPath,
                ),
              ),
              AccountItem(
                title: Center(
                  child: Text(
                    locale.madeBy,
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    locale.developer_email,
                    style: itemTextStyle,
                  ),
                ),
                path: '',
                trailing: null,
                leading: null,
              ),
              AccountItem(
                title: Text(
                  locale.location,
                ),
                subtitle: Text(
                  locale.location_description,
                  style: itemTextStyle,
                ),
                path: '',
                trailing: null,
                leading: const Icon(Icons.location_on_outlined),
              ),
              AccountItem(
                title: Text(
                  locale.languages_and_tools,
                ),
                subtitle: Text(
                  locale.tool_description,
                  style: itemTextStyle,
                ),
                path: '',
                trailing: null,
                leading: const Icon(Icons.pan_tool_alt_outlined),
              ),
              AccountItem(
                title: Text(
                  locale.fun_fact,
                ),
                subtitle: Text(
                  locale.fun_fact_description,
                  style: itemTextStyle,
                ),
                path: '',
                trailing: null,
                leading: const Icon(Icons.fact_check_outlined),
              ),
              showSpacer(height: MediaQuery.of(context).size.height / 6),
              const SocialButtonsBar(),
            ],
          ),
        ),
      ),
    );
  }
}
