import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../features/images/presentation/provider/get_images_notifier.dart';

class FloatingButtonsBar extends StatelessWidget {
  const FloatingButtonsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int page = context.select((GetImagesNotifier p) => p.getApiPage);
    return SizedBox(
      height: 65,
      child: Card(
        child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                context.read<GetImagesNotifier>().apiPageMinus();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color:
                    page > 1 ? null : Colors.grey.withOpacity(0.4),
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<GetImagesNotifier>().apiPagePlus();
              },
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
