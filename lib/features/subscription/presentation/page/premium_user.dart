import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/const/const_rive.dart';
import '../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../provider/purchase_provider.dart';

class PremiumUserStatus extends StatefulWidget {
  const PremiumUserStatus({super.key});

  @override
  State<PremiumUserStatus> createState() => _PremiumUserStatusState();
}

class _PremiumUserStatusState extends State<PremiumUserStatus> {
  double _size = 0.0;

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 200)).then(
      (value) => setState(() {
        _size = 1.0;
      }),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products =
        context.select((PurchaseProvider provider) => provider.products);
    final l = L.of(context);
    return SliverFillRemaining(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => Column(
          children: [
            Text(
              l.thanksForPremium,
              style: const TextStyle(fontSize: kFontSize),
            ),
            AnimatedScale(
              curve: Curves.easeIn,
              duration: const Duration(seconds: 1),
              scale: _size,
              child: const AnimationWithRive(
                path: kPremiumSuccess,
              ),
            ),
            Text(
              '${l.expirationDate}${products[index].expirationDate.substring(0, 10)}',
            ),
            OutlinedButton(
              onPressed: () async {
                if (!await launchUrl(
                  Uri.parse(products[index].shopUrl),
                )) {
                  throw 'Could not launch ${products[index].shopUrl}';
                }
              },
              child: Text(l.menageSubscription),
            ),
          ],
        ),
      ),
    );
  }
}
