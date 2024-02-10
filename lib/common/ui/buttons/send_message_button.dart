import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallnex/const/route_paths.dart';
import '../../../features/images/domain/entities/wallpaper.dart';

class SendMessageBtn extends StatelessWidget {
  const SendMessageBtn({super.key, required this.wallpaper});

  final Wallpaper wallpaper;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () => context.push(krConversationList, extra: wallpaper),
      ),
    );
  }
}
