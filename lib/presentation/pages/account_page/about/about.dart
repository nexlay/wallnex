import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import 'package:wallnex/presentation/provider/get_app_info_notifier.dart';

import '../../../../const.dart';

class WelcomeWallnexPage extends StatelessWidget {
  const WelcomeWallnexPage({Key? key}) : super(key: key);

  void onRiveInit(Artboard artboard) async {
    final controller = StateMachineController.fromArtboard(
      artboard,
      stateMachine,
    );
    artboard.addController(controller!);
  }

  @override
  Widget build(BuildContext context) {
    // **  Run your code after the widget has finished building.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAppInfoNotifier>().loadAppInfo();
    });

    final appName = context.select((GetAppInfoNotifier n) => n.appName);
    final appVersion = context.select((GetAppInfoNotifier n) => n.version);
    final appBuild = context.select((GetAppInfoNotifier n) => n.appBuild);

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: RiveAnimation.asset(
              welcome,
              onInit: onRiveInit,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height/3,
            child: Column(
              children: [
                Text(
                  appName,
                  style: const TextStyle(
                    fontSize: 26.0,
                  ),
                ),
                Text(
                  ' App version: $appVersion.$appBuild',
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Discover more',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Exit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
