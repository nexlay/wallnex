import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const_api_url.dart';
import '../../../../../../common/ui/slivers/custom_header_delegate.dart';
import '../../../../../../core/config/l10n/generated/app_localizations.dart';
import '../../../provider/get_images_notifier.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    Key? key,
  }) : super(key: key);

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

    return SliverPersistentHeader(
      floating: true,
      delegate: CustomHeader(
          childWidget: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (_, index) {
              return Card(
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
                        child: Image.asset(
                          'assets/image/categories/${kCategoriesListAsset[index]}.jpg',
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
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                list[index],
                                style: const TextStyle(color: Colors.white),
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
