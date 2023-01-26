import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/get_app_info_notifier.dart';

class DiscoverMore extends StatelessWidget {
  const DiscoverMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<GetAppInfoNotifier, Tuple3<String, String, String>>(
      selector: (_, provider) =>
          Tuple3(provider.appName, provider.appBuild, provider.version),
      builder: (_, value, __) => LicensePage(
        applicationIcon: Image.asset('assets/core/launch_image.png', width: 150,),
        applicationName: value.value1,
        applicationVersion: '${value.value3}.${value.value2}',
      ),
    );
  }
}
