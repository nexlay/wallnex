import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/messaging/domain/entities/message.dart';
import 'package:wallnex/features/messaging/presentation/page/widgets/chat_bubble.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';
import '../../../../const/const.dart';
import '../../../../const/route_paths.dart';
import '../../../images/presentation/provider/get_images_notifier.dart';
import '../provider/messaging_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.wallpaper});
  final Wallpaper wallpaper;
  @override
  Widget build(BuildContext context) {
    final messages = context.select(
        (MessagingProvider messagingProvider) => messagingProvider.messages);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Consumer2<MessagingProvider, LocalUser>(
        builder: (_, provider, localUser, __) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ChatMessageWidget(
                    alignment: messages[index].senderId == localUser.uId
                        ? Alignment.centerRight
                        : Alignment.centerRight,
                    message: messages[index],
                    wallpaper: wallpaper,
                  );
                },
              ),
            ),
            Padding(
              padding: kAppPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SendImageCard(
                    wallpaper: wallpaper,
                    showFavoriteBtn: false,
                    showImageSpecsBtn: false,
                    showSendBtn: false,
                    path: wallpaper.thumbsLarge,
                    goTo: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      provider
                          .sendMessage(
                              provider.searchUser.uId, wallpaper.thumbsLarge)
                          .whenComplete(
                            () => provider.getMessage(
                                localUser.uId, provider.searchUser.uId),
                          );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String text;

  ChatMessage({required this.text});
}

//TODO: make separate .dart file for this widget
class ChatMessageWidget extends StatelessWidget {
  final Wallpaper wallpaper;
  final Message message;
  final Alignment alignment;

  const ChatMessageWidget(
      {super.key,
      required this.wallpaper,
      required this.message,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: kAppPadding,
        child: SendImageCard(
          wallpaper: wallpaper,
          showFavoriteBtn: false,
          showImageSpecsBtn: false,
          showSendBtn: false,
          path: message.messageText.isEmpty
              ? wallpaper.thumbsLarge
              : message.messageText,
          goTo: () {
            context.read<GetImagesNotifier>().getImageById(wallpaper.id);
            context.push(krDetails, extra: wallpaper);
          },
        ),
      ),
    );
  }
}
