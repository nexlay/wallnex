import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../features/favorites/presentation/provider/favorites_images_notifier.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key, required this.wallpaper}) : super(key: key);

  final Wallpaper wallpaper;

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
    bool isFavorite = context.select((GetFavoritesNotifier f) => f.isFavorite);
    return IconButton(
      onPressed: () {
        if (isFavorite) {
          context
              .read<GetFavoritesNotifier>()
              .deleteFromFavorites(widget.wallpaper);
          context
              .read<GetFavoritesNotifier>().deleteFromFireStore(widget.wallpaper.id);
        } else {
          context
              .read<GetFavoritesNotifier>()
              .insertIntoFavorites(widget.wallpaper);
          context
              .read<GetFavoritesNotifier>().addIntoFireStore(widget.wallpaper);
        }
        _controller.forward().then((value) => _controller.reverse());
      },
      icon: ScaleTransition(
        scale: _controller,
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.redAccent : null,
        ),
      ),
    );
  }
}
