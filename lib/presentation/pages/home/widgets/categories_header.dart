import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../const.dart';
import '../../../common/ui/slivers/custom_header_delegate.dart';
import '../../../provider/get_images_notifier.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: CustomHeader(
          childWidget: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (_, index) {
              return Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<GetImagesNotifier>()
                        .categoriesUrl(categoriesUrl+categoriesList[index]+categoriesPage);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/images/categories/${categoriesList[index]}.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 2,
                            sigmaY: 1,
                          ),
                          child: Center(
                            child: Text(
                              categoriesList[index],
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          maxExtend: 80,
          minExtend: 80),
    );
  }
}
