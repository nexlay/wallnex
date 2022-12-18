import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/provider/get_wallpapers_from_api_notifier.dart';
import '../../../../const.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (_, index) {
            return Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(10.0),
                onTap: () {
                  context
                      .read<GetWallpapersNotifier>()
                      .categoriesUrl(categoriesUrl[index]);
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
                    Card(
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          categoriesList[index],
                          style:
                              const TextStyle(fontSize: 16.0, color: Colors.white,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
