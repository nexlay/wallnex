import 'package:flutter/material.dart';
import 'package:wallnex/presentation/common/ui/slivers/custom_header_delegate.dart';
import '../../../../core/util/image_search.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: CustomHeader(
          childWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SizedBox(
              height: 60,
              child: Card(
                child: TextButton.icon(
                  onPressed: () {
                    showSearch(context: context, delegate: ImageSearch());
                  },
                  label: const Text('Search images'), icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          maxExtend: 60,
          minExtend: 60),
    );
  }
}
