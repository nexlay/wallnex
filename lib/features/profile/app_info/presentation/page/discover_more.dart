import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const_rive.dart';
import '../../../../../common/ui/animations/animation_with_rive.dart';
import '../provider/get_app_info_notifier.dart';

class DiscoverMore extends StatelessWidget {
  const DiscoverMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<GetAppInfoNotifier, Tuple3<String, String, String>>(
      selector: (_, provider) =>
          Tuple3(provider.appName, provider.appBuild, provider.version),
      builder: (_, value, __) => LicensePage(
        applicationIcon: const AnimationWithRive(path: kLogo,),
        applicationName: value.value1,
        applicationVersion: '${value.value3}.${value.value2}',
        applicationLegalese: 'Best regards to Wallhaven team for high-quality APIs',
      ),
    );
  }
}
