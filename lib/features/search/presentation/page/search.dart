import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/search/presentation/provider/get_search_history_notifier.dart';
import '../../../../common/ui/slivers/custom_header_delegate.dart';
import '../../../../core/delegates/image_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: CustomHeader(
          childWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: SizedBox(
              height: 60,
              child: Card(
                child: TextButton.icon(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: ImageSearch(),
                    );
                    context.read<GetSearchHistoryNotifier>().getSearchHistory();
                  },
                  label: Text(AppLocalizations.of(context)!.searchImages),
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          maxExtend: 60,
          minExtend: 60),
    );
  }
}