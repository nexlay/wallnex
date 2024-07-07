import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../const/const.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';
import '../../images/presentation/provider/get_images_notifier.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    final list = [
      locale.landscapes,
      locale.cityscapes,
      locale.abstract,
      locale.space,
      locale.cars,
    ];
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: list.length,
        (_, index) => Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: GestureDetector(
            onTap: () {
              context
                  .read<GetImagesNotifier>()
                  .searchByCategories(kCategoriesListAsset[index]);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage(
                        'assets/image/categories/${kCategoriesListAsset[index]}.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      list[index],
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: kFontSize),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
