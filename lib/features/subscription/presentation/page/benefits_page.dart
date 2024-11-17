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

    final benefits = [
      BenefitData(l.premiumBenefit_1, l.premiumBenefit_sub_1),
      BenefitData(l.premiumBenefit_2, l.premiumBenefit_sub_2),
      BenefitData(l.premiumBenefit_3, l.premiumBenefit_sub_3),
      BenefitData(l.premiumBenefit_4, l.premiumBenefit_sub_4),
    ];

    return SliverToBoxAdapter(
      child: Consumer<PurchaseProvider>(
        builder: (_, purchasesProvider, __) {
          final productPriceString =
              '${purchasesProvider.product.currencyCode} ${purchasesProvider.product.price.toString()}/${l.month}';

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AnimationWithRive(path: kPremiumCongratulation),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kPaddingSize),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(kPaddingSize),
                    child: Column(
                      children: [
                        Column(
                          children: benefits
                              .map(
                                (benefit) => OnPageListTile(
                                  title: Text(benefit.title),
                                  enabled: false,
                                  subtitle: Text(benefit.subtitle),
                                  leading: const Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(
                          height: kHeightForSpacer,
                        ),
                        ElevatedButton(
                          onPressed: () => purchasesProvider
                              .purchase(purchasesProvider.product),
                          child: Text(
                            productPriceString,
                            style: const TextStyle(
                                fontSize: kFontSizeMid,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                l.billed_yearly_cancel_anytime,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          );
        },
      ),
    );
  }
}
