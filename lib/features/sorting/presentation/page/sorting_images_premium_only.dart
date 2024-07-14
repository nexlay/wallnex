import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/premium_user_wrapper.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import 'package:wallnex/features/sorting/presentation/provider/sorting_provider.dart';
import '../../../../common/ui/slivers/custom_header_delegate.dart';
import '../../../../core/config/l10n/generated/app_localizations.dart';

class SortingImages extends StatelessWidget {
  const SortingImages({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    final l = [
      locale.views,
      locale.relevance_sorting,
      locale.random_sorting,
      locale.favorites_sorting,
      locale.toplist_sorting,
    ];
    return SliverPersistentHeader(
      delegate: CustomHeader(
        childWidget: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: kSortingListAsset.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Consumer<GetImagesNotifier>(
                builder: (_, imageProvider, __) => Consumer<SortingProvider>(
                  builder: (_, sortingProvider, __) => PremiumAccessWrapper(
                    childWidget: ChoiceChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kFontSize),
                      ),
                      label: Text(l[index]),
                      selected: sortingProvider.value == index,
                      onSelected: (bool selected) {
                        sortingProvider.value = index;
                        imageProvider.searchBySorting(kSortingListAsset[index]);
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        maxExtend: 80,
        minExtend: 80,
      ),
    );
  }
}
