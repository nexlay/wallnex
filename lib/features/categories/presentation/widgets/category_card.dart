import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/loading_status/placeholder.dart';
import '../../../../common/ui/navigation_bar/provider/get_default_home_page_notifier.dart';
import '../../../../const/const.dart';
import '../../../images/presentation/provider/get_images_notifier.dart';
import '../../domain/entities/Category.dart';
import '../provider/category_images_notifier.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.05, 0.05))
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          context
              .read<GetImagesNotifier>()
              .searchByCategories(widget.category.assetName)
              .then(
                (_) => context.read<GetPages>().changeTab(1),
              );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            FutureBuilder<String?>(
              future: context
                  .read<CategoryImagesNotifier>()
                  .fetchCategoryImage(widget.category.assetName),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return SlideTransition(
                    position: _slideAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                        placeholder: (context, url) =>
                            const CustomPlaceholder(),
                        errorWidget: (context, url, error) =>
                            const CustomPlaceholder(),
                      ),
                    ),
                  );
                }
                return const SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: CustomPlaceholder(),
                );
              },
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  widget.category.name,
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
