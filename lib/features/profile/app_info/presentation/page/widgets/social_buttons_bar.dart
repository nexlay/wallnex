import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../const/custom_social_icons.dart';
import '../../../../../../core/config/env/env.dart';

class SocialButtonsBar extends StatelessWidget {
  const SocialButtonsBar({Key? key}) : super(key: key);

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
            size: 30.0,
          ),
        ),
        IconButton(
          onPressed: () {
            _launch(Env.gitUrl);
          },
          icon: const Icon(
            CustomSocial.github_circled,
            size: 30.0,
          ),
        ),
        IconButton(
          onPressed: () {
            _launch(Env.linkedUrl);
          },
          icon: const Icon(
            CustomSocial.linkedin_circled,
            size: 30.0,
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
