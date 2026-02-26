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

class PurchasesAndSubscriptions extends StatefulWidget {
  const PurchasesAndSubscriptions({super.key});

  @override
  State<PurchasesAndSubscriptions> createState() =>
      _PurchasesAndSubscriptionsState();
}

class _PurchasesAndSubscriptionsState extends State<PurchasesAndSubscriptions> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PurchaseProvider>().checkSubscriptionStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    final locale = L.of(context);
    return Scaffold(
      body: BodyScrollView(
        title: locale.yourPremium,
        childWidget: Consumer<PurchaseProvider>(
          builder: (context, purchase, _) {
            return purchase.isLoading
                ? const SliverFillRemaining(
                    child: ProgressLoader(),
                  )
                : _buildContent(
                    purchase.product,
                    purchase.purchaseResult,
                    EmptySliverScreen(
                      assetPath: kEmptySuggestions,
                      title: locale.imagesNotFound,
                      subtitle: locale.tryToReload,
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget _buildContent(Product product, bool isPurchased, Widget emptyScreen) {
    if (isPurchased) {
      return const PremiumUserStatus();
    } else if (product.id.isNotEmpty) {
      return const PurchasesPage();
    } else {
      return emptyScreen;
    }
  }
}
