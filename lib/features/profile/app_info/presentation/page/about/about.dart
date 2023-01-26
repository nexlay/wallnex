import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:wallnex/features/profile/app_info/presentation/page/more_info/discover_more.dart';
import '../../../../../../const/const_rive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider/get_app_info_notifier.dart';

class AppInformation extends StatelessWidget {
  const AppInformation({Key? key}) : super(key: key);

  void onRiveInit(Artboard artboard) async {
    final controller = StateMachineController.fromArtboard(
      artboard,
      stateMachine,
    );
    artboard.addController(controller!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: RiveAnimation.asset(
              welcome,
              onInit: onRiveInit,
            ),
          ),
          Selector<GetAppInfoNotifier, Tuple3<String, String, String>>(
            selector: (_, provider) =>
                Tuple3(provider.appName, provider.version, provider.appBuild),
            builder: (_, value, __) {
              return Positioned(
                bottom: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: [
                    Text(
                      value.value1,
                      style: const TextStyle(
                        fontSize: 26.0,
                      ),
                    ),
                    Text(
                      ' ${AppLocalizations.of(context)!.version}: ${value.value2}.${value.value3}',
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 50,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ButtonBar(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const DiscoverMore()));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.discoverMore,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.exit,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
