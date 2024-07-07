import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../const/const.dart';
import '../../../../const/custom_social_icons.dart';
import '../../../../core/config/env/env.dart';

class SocialButtonsBar extends StatelessWidget {
  const SocialButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            _launch(Env.twitterUrl);
          },
          icon: const Icon(
            CustomSocial.twitter_circled,
            size: kUnselectedIconSize,
          ),
        ),
        IconButton(
          onPressed: () {
            _launch(Env.gitUrl);
          },
          icon: const Icon(
            CustomSocial.github_circled,
            size: kUnselectedIconSize,
          ),
        ),
        IconButton(
          onPressed: () {
            _launch(Env.linkedUrl);
          },
          icon: const Icon(
            CustomSocial.linkedin_circled,
            size: kUnselectedIconSize,
          ),
        ),
      ],
    );
  }
}

Future _launch(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
