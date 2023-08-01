import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/on_page_item.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/const/route_paths.dart';
import 'package:wallnex/features/subscription/presentation/page/widgets/subscription_offer.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../provider/purchase_provider.dart';

class PurchasesPage extends StatelessWidget {
  const PurchasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Consumer<PurchaseProvider>(
        builder: (_, purchasesProvider, __) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SubscriptionOffer(),
            AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstChild: Column(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size.fromHeight(
                          MediaQuery.of(context).size.height / 20),
                    ),
                    onPressed: () => purchasesProvider.purchase(
                      purchasesProvider.product,
                    ),
                    child: Text(l.start),
                  ),
                  Text(
                    l.billed_yearly_cancel_anytime,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              secondChild: Hero(
                tag: 'benefits',
                child: Material(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(kRadius),
                    ),
                  ),
                  child: OnPageItem(
                    title: Text(l.special_offers_and_features),
                    subtitle: Text(l.check_what_you_might_get),
                    path: krBenefitsInfo,
                    leading: const Icon(Icons.info_outline),
                  ),
                ),
              ),
              crossFadeState: purchasesProvider.offer == PurchaseOffer.premium
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ],
        ),
      ),
    );
  }
}
