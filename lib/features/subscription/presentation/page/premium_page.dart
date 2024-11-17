import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/const/const_rive.dart';
import '../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../provider/purchase_provider.dart';

class PremiumUserStatus extends StatelessWidget {
  const PremiumUserStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final product =
        context.select((PurchaseProvider provider) => provider.product);
    final l = L.of(context);
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const AnimationWithRive(path: kPremiumCongratulation),
              Text(
                l.thanksForPremium,
                style: const TextStyle(
                    fontSize: kFontSizeMid, fontWeight: FontWeight.bold),
              ),
              Text(
                l.getting_the_best_of_Wallnex,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Text(
            '${l.expirationDate} ${product.expirationDate.length >= 10 ? product.expirationDate.substring(0, 10) : product.expirationDate}',
          ),
          const AnimationWithRive(
            path: kPremiumSuccess,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize:
                  Size.fromHeight(MediaQuery.of(context).size.height / 20),
            ),
            onPressed: () async {
              if (!await launchUrl(
                mode: LaunchMode.externalApplication,
                Uri.parse(product.shopUrl),
              )) {
                throw 'Could not launch ${product.shopUrl}';
              }
            },
            child: Text(l.menageSubscription),
          ),
        ],
      ),
    );
  }
}
