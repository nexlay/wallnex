import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/route_paths.dart';
import 'package:wallnex/features/subscription/presentation/provider/purchase_provider.dart';

class PremiumAccessWrapper extends StatelessWidget {
  const PremiumAccessWrapper(
      {super.key, required this.childWidget, this.alignment});

  final Widget childWidget;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseProvider>(
      builder: (_, purchase, __) => purchase.purchaseResult
          ? childWidget
          : GestureDetector(
              onTap: () => context.push(krPurchases),
              child: Badge(
                largeSize: 22,
                alignment: alignment,
                backgroundColor: Colors.amberAccent.withOpacity(0.6),
                label: Icon(
                  Icons.star_rate_outlined,
                  color: Colors.white.withOpacity(0.6),
                  size: 16.0,
                ),
                child: AbsorbPointer(child: childWidget),
              ),
            ),
    );
  }
}
