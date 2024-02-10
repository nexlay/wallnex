import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallnex/common/ui/premium_user_wrapper.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';

class SupportDev extends StatelessWidget {
  const SupportDev({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);

    const icons = [
      Icons.star_rate_outlined,
      Icons.share_outlined,
      Icons.feedback_outlined,
    ];

    final title = [
      l.rate_this_app,
      l.share_this_app,
      l.bugs_feedback,
    ];

    final openUrl = [
      () async {
        if (!await launchUrl(
          mode: LaunchMode.externalApplication,
          Uri.parse(
              'https://play.google.com/store/apps/details?id=com.pryhodskyimykola.wallnex'),
        )) {
          throw 'Could not launch';
        }
      },
      () {
        Share.share(
            '${l.share_text} https://play.google.com/store/apps/details?id=com.pryhodskyimykola.wallnex');
      },
      () async {
        if (!await launchUrl(
          mode: LaunchMode.externalApplication,
          Uri.parse('mailto:pryhodskyimykola@gmail.com?'),
        )) {
          throw 'Could not launch';
        }
      },
    ];

    return Column(
      children: List<Widget>.generate(
        icons.length,
        (index) => index < icons.length - 1
            ? ListTile(
                title: Text(title[index]),
                leading: Icon(
                  icons[index],
                ),
                onTap: openUrl[index],
              )
            : PremiumUserWrapper(
                childWidget: ListTile(
                  title: Text(title[index]),
                  leading: Icon(
                    icons[index],
                  ),
                  onTap: openUrl[index],
                ),
              ),
      ),
    );
  }
}
