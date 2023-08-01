import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/subscription/presentation/provider/purchase_provider.dart';
import '../../../../../const/const.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';

class SubscriptionOffer extends StatefulWidget {
  const SubscriptionOffer({super.key});

  @override
  State<SubscriptionOffer> createState() => _SubscriptionOfferState();
}

class _SubscriptionOfferState extends State<SubscriptionOffer> {
  @override
  Widget build(BuildContext context) {
    final l = L.of(context);

    return Consumer<PurchaseProvider>(
      builder: (_, purchaseProvider, __) => SegmentedButton(
        segments: <ButtonSegment<PurchaseOffer>>[
          ButtonSegment(
            value: PurchaseOffer.free,
            icon: const Icon(
              Icons.person_outline,
              color: Colors.grey,
              size: kSocialIconSize,
            ),
            label: Padding(
              padding: kAppPadding,
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: '${l.free}\n',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${purchaseProvider.product.currencyCode} ',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const TextSpan(
                      text: '0.0',
                      style: TextStyle(
                        fontSize: kSocialIconSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' /${l.month}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ButtonSegment(
            value: PurchaseOffer.premium,
            icon: const Icon(
              Icons.star_border_outlined,
              color: Colors.amberAccent,
              size: kSocialIconSize,
            ),
            label: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: '${l.prem}\n',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '${purchaseProvider.product.currencyCode} ',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: purchaseProvider.product.price.toString(),
                    style: const TextStyle(
                      fontSize: kSocialIconSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' /${l.month}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
        selected: <PurchaseOffer>{purchaseProvider.offer},
        onSelectionChanged: (Set<PurchaseOffer> newSelection) {
          purchaseProvider.setPurchases(newSelection.first);
        },
      ),
    );
  }
}
