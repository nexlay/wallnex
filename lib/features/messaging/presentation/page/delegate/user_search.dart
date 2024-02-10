import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/common/ui/on_page_list_tile.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/const/route_paths.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/messaging/domain/entities/search_user.dart';
import 'package:wallnex/features/messaging/presentation/provider/messaging_provider.dart';
import '../../../../../common/ui/image/network_image_viewer.dart';
import '../../../../../core/config/l10n/generated/app_localizations.dart';

class UserSearch extends SearchDelegate<SearchUser> {
  set searchFieldLabel(String? field) => super.searchFieldLabel;

  final Wallpaper wallpaper;

  UserSearch({required this.wallpaper});

  @override
  List<Widget>? buildActions(BuildContext context) {
    searchFieldLabel = L.of(context).searchImages;
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          size: 18.0,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(
        context,
        SearchUser.initialData(),
      ),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchUser = context.select((MessagingProvider m) => m.searchUser);
    Future.delayed(Duration.zero, () async {
      context.read<MessagingProvider>().searchUserInDatabase(query);
      context.read<MessagingProvider>().setToHistory(searchUser);
    });
    return Padding(
      padding: kAppPadding,
      child: OnPageListTile(
        title: Text(searchUser.name),
        subtitle: Text(searchUser.email),
        leading: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
            width: 50,
            height: 50,
            child: NetworkImageViewer(
              url: searchUser.photoUrl,
            ),
          ),
        ),
        path: krChatScreen,
        wallpaper: wallpaper,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      context.read<MessagingProvider>().getFromHistory();
    });
    final searchHistory = context.select((MessagingProvider m) => m.history);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Center(
        child: searchHistory.isEmpty
            ? Text(L.of(context).noSearchHistory)
            : Card(
                color: Colors.transparent,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 0.1,
                      height: 2.0,
                      color: Colors.transparent,
                    );
                  },
                  itemCount: searchHistory.length,
                  itemBuilder: (_, index) => ListTile(
                    tileColor: Theme.of(context).colorScheme.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.north_west,
                        size: 18.0,
                      ),
                      onPressed: () {},
                    ),
                    leading: const Icon(Icons.history),
                    title: Text(searchHistory[index].name),
                    subtitle: Text(searchHistory[index].name),
                    onTap: () {
                      query = searchHistory[index].email;
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
