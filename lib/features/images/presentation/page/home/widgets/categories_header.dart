import 'package:flutter/material.dart';
import 'package:wallnex/features/categories/domain/entities/Category.dart';
import '../../../../../../common/ui/slivers/custom_header_delegate.dart';
import '../../../../../../const/const.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../../../categories/presentation/widgets/category_card.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);

    final categories = [
      Category(locale.landscapes, kCategoriesListAsset[0]),
      Category(locale.cityscapes, kCategoriesListAsset[1]),
      Category(locale.abstract, kCategoriesListAsset[2]),
      Category(locale.space, kCategoriesListAsset[3]),
      Category(locale.cars, kCategoriesListAsset[4]),
    ];

    return SliverPersistentHeader(
      floating: true,
      delegate: CustomHeader(
        childWidget: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (_, index) {
            return SizedBox(
              width: 200,
              child: CategoryCard(
                category: categories[index],
              ),
            );
          },
        ),
        maxExtend: 200,
        minExtend: 200,
      ),
    );
  }
}
