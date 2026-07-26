import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../features/images/presentation/provider/get_images_notifier.dart';

const firstPage = 1;
const btnHeight = 65.0;
const opacity = 0.4;

class FloatingButtonsBar extends StatelessWidget {
  const FloatingButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final page = context.select((GetImagesNotifier p) => p.value);
    final selected = context.select((GetImagesNotifier p) => p.isSelectedPage);

    // Używamy Align, aby przypiąć pasek do dołu ekranu, zachowując jego zwartą szerokość
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 16.0), // Odstęp od dolnej krawędzi lub nawigacji systemu
        child: SizedBox(
          height: btnHeight,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize
                    .min, // Sprawia, że pasek dopasowuje się szerokością do ikonek
                children: [
                  IconButton(
                    isSelected: selected,
                    disabledColor: page > firstPage
                        ? Colors.grey.withOpacity(opacity)
                        : null,
                    onPressed: page == firstPage
                        ? null
                        : () =>
                            context.read<GetImagesNotifier>().decrementPage(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  const SizedBox(width: 24),
                  IconButton(
                    isSelected: selected,
                    onPressed: () =>
                        context.read<GetImagesNotifier>().incrementPage(),
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
