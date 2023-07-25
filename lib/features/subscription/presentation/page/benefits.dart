import 'package:flutter/material.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/const/const.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';

class Benefits extends StatelessWidget {
  const Benefits({super.key});

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);
    final benefits = [
      l.premiumBenefit_1,
      l.premiumBenefit_2,
      l.premiumBenefit_3
    ];
    return Hero(
      tag: 'benefits',
      child: Scaffold(
        body: BodyScrollView(
          title: 'Your benefits',
          childWidget: SliverFillRemaining(
            child: Column(
              children: List<Widget>.generate(
                kSubscriptionBenefits.length,
                (index) => Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        kSubscriptionBenefits[index],
                      ),
                      Text(benefits[index]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
