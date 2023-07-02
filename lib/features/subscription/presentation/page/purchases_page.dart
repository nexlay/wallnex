import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../const/const.dart';
import '../provider/purchase_provider.dart';

class PurchasesPage extends StatelessWidget {
  const PurchasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products =
        context.select((PurchaseProvider provider) => provider.products);
    final benefits = [
      'An ad-free experience',
      'Priority customer support',
      'Advanced customization features',
    ];
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: kSubscriptionBenefits.length,
              itemBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Image(
                        image: AssetImage(kSubscriptionBenefits[index]),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: Text(
                        benefits[index],
                        style: const TextStyle(
                          fontSize: kFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => OutlinedButton(
                onPressed: () => context.read<PurchaseProvider>().purchase(
                      products[index],
                    ),
                child: Text('${products[index].price.toString()} ${products[index].currencyCode}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
