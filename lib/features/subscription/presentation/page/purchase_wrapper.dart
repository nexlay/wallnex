import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/features/subscription/presentation/page/premium_page.dart';
import 'package:wallnex/features/subscription/presentation/page/benefits_page.dart';
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
    final purchaseProvider = context.watch<PurchaseProvider>();
    final product = purchaseProvider.product;
    final isLoading = purchaseProvider.isLoading;
    final isPurchased = purchaseProvider.purchaseResult;

    return _buildBody(context, product, isLoading, isPurchased);
  }

  Widget _buildBody(
    BuildContext context,
    Product product,
    bool isLoading,
    bool isPurchased,
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
            : _buildContent(product, isPurchased, emptyScreen),
      ),
    );
  }

  Widget _buildContent(Product product, bool isPurchased, Widget emptyScreen) {
    if (product.id.isEmpty && !isPurchased) {
      return emptyScreen;
    } else if (product.id.isNotEmpty && !isPurchased) {
      return const PurchasesPage();
    } else if (isPurchased) {
      return const PremiumUserStatus();
    } else {
      return emptyScreen;
    }
  }
}
