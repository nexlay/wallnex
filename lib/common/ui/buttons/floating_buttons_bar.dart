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
    return SizedBox(
      height: btnHeight,
      child: Card(
        child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              isSelected: selected,
              disabledColor:
                  page > firstPage ? Colors.grey.withOpacity(opacity) : null,
              onPressed: page == firstPage
                  ? null
                  : () => context.read<GetImagesNotifier>().pageMinus(),
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
            IconButton(
              isSelected: selected,
              onPressed: () => context.read<GetImagesNotifier>().pagePlus(),
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
