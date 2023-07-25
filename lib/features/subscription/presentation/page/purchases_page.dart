import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/on_page_item.dart';
import 'package:wallnex/const/route_paths.dart';
import 'package:wallnex/features/subscription/presentation/page/widgets/subscription_offer.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../provider/purchase_provider.dart';

class PurchasesPage extends StatelessWidget {
  const PurchasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products =
        context.select((PurchaseProvider provider) => provider.products);
    final l = L.of(context);
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SubscriptionOffer(
                currency: products[index].currencyCode,
                price: products[index].price.toString(),
              ),
              const Hero(
                tag: 'benefits',
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: OnPageItem(
                    title: Text('Special offers and features'),
                    subtitle: Text('Check what you get'),
                    path: krBenefitsInfo,
                    leading: Icon(
                      Icons.info_outline,
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () => context.read<PurchaseProvider>().purchase(
                        products[index],
                      ),
                  child: const Text('Start'),
                ),
              ),
              const Text(
                'Billed yearly, cancel anytime',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
