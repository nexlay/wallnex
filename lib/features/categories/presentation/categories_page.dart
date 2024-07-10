import 'package:flutter/material.dart';
import 'package:wallnex/features/categories/presentation/widgets/category_card.dart';
import '../../../const/const.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';
import '../domain/entities/Category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

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

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: categories.length,
        (_, index) {
          return CategoryCard(
            category: categories[index],
          );
        },
      ),
    );
  }
}
