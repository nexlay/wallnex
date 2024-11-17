import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/loading_status/placeholder.dart';
import '../../../../common/ui/navigation_bar/provider/get_default_home_page_notifier.dart';
import '../../../../const/const.dart';
import '../../../images/presentation/provider/get_images_notifier.dart';
import '../../domain/entities/Category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        // Use InkWell for better feedback
        onTap: () {
          context
              .read<GetImagesNotifier>()
              .searchByCategories(category.assetName)
              .then(
                (_) => context.read<GetPages>().changeTab(1),
              );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/image/categories/${category.assetName}.jpg',
                fit: BoxFit.cover,
                width: double.infinity, // Ensure image covers the card
                height: 200, // Set a fixed height for consistency
                errorBuilder: (context, error, stack) {
              return const SizedBox(
                width: double.infinity, // Ensure image covers the card
                height: 200, // Set a fixed height for consistency
                child: CustomPlaceholder(),
              );
            }),
            Positioned.fill(
              child: Center(
                child: Text(
                  category.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: kFontSizeMid,
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
