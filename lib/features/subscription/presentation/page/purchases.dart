import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/features/subscription/presentation/page/premium_page.dart';
import 'package:wallnex/features/subscription/presentation/page/purchases_page.dart';
import '../../../../common/ui/epty_screen/empty_sliver_screen.dart';
import '../../../../common/ui/loading_status/progess_indicator.dart';
import '../../../../const/const_rive.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../../domain/entities/product.dart';
import '../provider/purchase_provider.dart';

class PurchasesAndSubscriptions extends StatelessWidget {
  const PurchasesAndSubscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    final subscriptions =
        context.select((PurchaseProvider provider) => provider.product);
    final isLoading =
        context.select((PurchaseProvider provider) => provider.isLoading);
    final purchaseResult =
        context.select((PurchaseProvider provider) => provider.purchaseResult);
    return _showBody(
      context,
      subscriptions,
      isLoading,
      purchaseResult,
    );
  }

  Widget _showBody(
    BuildContext context,
    Product product,
    bool isLoading,
    bool purchaseResult,
  ) {
    final locale = L.of(context);
    final emptyScreen = EmptySliverScreen(
      assetPath: kEmptySuggestions,
      title: locale.imagesNotFound,
      subtitle: locale.tryToReload,
    );

    return Scaffold(
      body: BodyScrollView(
        title: locale.yourPremium,
        childWidget: isLoading
            ? const SliverFillRemaining(
                child: ProgressLoader(),
              )
            : !isLoading && product.id.isEmpty && !purchaseResult
                ? emptyScreen
                : !isLoading && product.id.isNotEmpty && !purchaseResult
                    ? const PurchasesPage()
                    : !isLoading && purchaseResult
                        ? const PremiumUserStatus()
                        : emptyScreen,
      ),
    );
  }
}
