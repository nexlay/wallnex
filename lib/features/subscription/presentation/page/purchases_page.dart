import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/ui/animations/animation_with_rive.dart';
import '../../../../common/ui/on_page_list_tile.dart';
import '../../../../const/const.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../provider/purchase_provider.dart';

class PurchasesPage extends StatelessWidget {
  const PurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);

    final benefits = [
      l.premiumBenefit_1,
      l.premiumBenefit_2,
      l.premiumBenefit_3,
      l.premiumBenefit_4,
    ];

    final benefitsSubtitle = [
      l.premiumBenefit_sub_1,
      l.premiumBenefit_sub_2,
      l.premiumBenefit_sub_3,
      l.premiumBenefit_sub_4,
    ];

    return SliverFillRemaining(
      child: SingleChildScrollView(
        child: Consumer<PurchaseProvider>(
          builder: (_, purchasesProvider, __) => Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: benefits.length,
                itemBuilder: (_, index) => OnPageListTile(
                  title: Text(
                    benefits[index],
                  ),
                  enabled: false,
                  subtitle: Text(benefitsSubtitle[index]),
                  leading: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              OutlinedButton(
                onPressed: () =>
                    purchasesProvider.purchase(purchasesProvider.product),
                child: Text(
                  '${purchasesProvider.product.currencyCode} ${purchasesProvider.product.price.toString()}/${l.month}',
                  style: const TextStyle(fontSize: kFontSize),
                ),
              ),
              Text(
                l.billed_yearly_cancel_anytime,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
