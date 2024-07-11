import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/ui/on_page_list_tile.dart';
import '../../../../const/const.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';
import '../domain/entities/benefits.dart';
import '../provider/purchase_provider.dart';

class PurchasesPage extends StatefulWidget {
  const PurchasesPage({super.key});

  @override
  State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _shapeOpacityAnimation;
  late Animation<double> _shapeScaleAnimation;
  late Animation<Offset> _shapePositionAnimation;
  late Animation<double> _rotationAnimation;

  // Define animation durations as constants for better readability and maintainability
  static const Duration _animationDuration = Duration(seconds: 3);
  static const double _initialShapeOpacity = 0.2;
  static const double _finalShapeOpacity = 1.0;
  static const double _initialShapeScale = 0.5;
  static const double _finalShapeScale = 1.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..repeat(reverse: true);

    _shapeOpacityAnimation =
        Tween<double>(begin: _initialShapeOpacity, end: _finalShapeOpacity)
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _shapeScaleAnimation =
        Tween<double>(begin: _initialShapeScale, end: _finalShapeScale).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _shapePositionAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * 3.14159)
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
              // Animated shapes with icon
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => Stack(
                  alignment: Alignment.center,
                  children: [
                    // First shape (pulsing)
                    Opacity(
                      opacity: _shapeOpacityAnimation.value,
                      child: Transform.translate(
                        offset: _shapePositionAnimation.value,
                        child: Transform.scale(
                          scale: _shapeScaleAnimation.value,
                          child: ClipOval(
                            child: Container(
                              color: Colors.greenAccent,
                              width: 100,
                              height: 100,
                              // Icon inside the first shape
                              child: const Icon(
                                Icons.workspace_premium_sharp,
                                size: kSelectedIconSize,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Second shape (rotating)
                    Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: ClipOval(
                        child: Container(
                          color: Colors.green.withOpacity(0.5),
                          width: 70,
                          height: 70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Rest of the content
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
