import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../common/ui/on_page_list_tile.dart';
import '../../../../const/const.dart';
import '../../../../const/const_rive.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../domain/entities/benefits.dart';
import '../provider/purchase_provider.dart';

class PurchasesPage extends StatelessWidget {
  const PurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);

    // Extract benefit data creation outside the build method for better performance
    final benefits = [
      BenefitData(l.premiumBenefit_1, l.premiumBenefit_sub_1),
      BenefitData(l.premiumBenefit_2, l.premiumBenefit_sub_2),
      BenefitData(l.premiumBenefit_3, l.premiumBenefit_sub_3),
      BenefitData(l.premiumBenefit_4, l.premiumBenefit_sub_4),
    ];

    return SliverFillRemaining(
      child: Consumer<PurchaseProvider>(
        builder: (_, purchasesProvider, __) {
          // Extract the product price string for better readability
          final productPriceString =
              '${purchasesProvider.product.currencyCode} ${purchasesProvider.product.price.toString()}/${l.month}';

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              const AnimationWithRive(path: kPremiumCongratulation),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: benefits.length,
                itemBuilder: (_, index) => OnPageListTile(
                  title: Text(benefits[index].title),
                  enabled: false,
                  subtitle: Text(benefits[index].subtitle),
                  leading: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                ),
              ),
              Column(
                children: [
                  OutlinedButton(
                    onPressed: () =>
                        purchasesProvider.purchase(purchasesProvider.product),
                    child: Text(
                      productPriceString,
                      style: const TextStyle(fontSize: kFontSize),
                    ),
                  ),
                  Text(
                    l.billed_yearly_cancel_anytime,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
