import 'package:flutter/material.dart';
import 'package:wallnex/common/ui/slivers/custom_scroll_view.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/messaging/presentation/page/delegate/user_search.dart';

class ConversationsList extends StatelessWidget {
  const ConversationsList({super.key, required this.wallpaper});

  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.chat_bubble_outline),
        onPressed: () => showSearch(
            context: context, delegate: UserSearch(wallpaper: wallpaper)),
        label: const Text('Start chat'),
      ),
      body: const BodyScrollView(
        title: 'Conversations',
        childWidget: SliverToBoxAdapter(),
      ),
    );
  }
}
