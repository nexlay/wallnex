import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/const/const.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../core/config/l10n/generated/app_localizations.dart';
import '../../../features/favorites/presentation/provider/favorites_images_notifier.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    required this.wallpaper,
    this.showText = true,
    this.showCircleAvatar = false,
  });

  final Wallpaper wallpaper;
  final bool showText;
  final bool showCircleAvatar;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.3,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = L.of(context);
    return Padding(
      padding: kAppPadding,
      child: IconButton(
        onPressed: () {
          if (widget.wallpaper.isFavorite) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(locale.areYouSure),
                content: Text(locale.removeFavorite),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(locale.no),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<FavoritesNotifier>()
                          .deleteFromFavorites(widget.wallpaper);
                      Navigator.pop(context);
                    },
                    child: Text(locale.yes),
                  ),
                ],
              ),
            );
          } else {
            context
                .read<FavoritesNotifier>()
                .insertIntoFavorites(widget.wallpaper);
          }
          _controller.forward().then((value) => _controller.reverse());
        },
        icon: ScaleTransition(
          scale: _controller,
          child: Consumer<FavoritesNotifier>(
            builder: (_, __, ___) => Column(
              children: [
                if (widget.showCircleAvatar)
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black.withOpacity(0.6),
                    child: Icon(
                      Icons.favorite,
                      color: widget.wallpaper.isFavorite
                          ? Colors.redAccent
                          : Colors.white,
                    ),
                  )
                else
                  Icon(
                    Icons.favorite,
                    color: widget.wallpaper.isFavorite
                        ? Colors.redAccent
                        : Colors.white,
                  ),
                if (widget.showText)
                  Text(
                    widget.wallpaper.isFavorite ? locale.dislike : locale.like,
                    style: const TextStyle(color: Colors.white),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
