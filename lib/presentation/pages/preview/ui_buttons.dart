import 'package:flutter/material.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/presentation/pages/preview/widgets/preview_buttons_bar.dart';
import 'package:wallnex/presentation/pages/preview/widgets/set_wallpaper_buttons_bar.dart';

class BottomUiElements extends StatefulWidget {
  const BottomUiElements({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;
  @override
  State<BottomUiElements> createState() => _BottomUiElementsState();
}

class _BottomUiElementsState extends State<BottomUiElements> {
  double width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  //TODO: Check for different screen size
  double height =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height /
          4.5;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      width: width,
      height: height,
      duration: const Duration(milliseconds: 500),
      child: Card(
        child: SingleChildScrollView(
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(
                    () {
                      selected = !selected;
                      selected
                          ? height = 60
                          : height = MediaQuery.of(context).size.height / 4.5;
                      selected
                          ? width = 60
                          : width = MediaQuery.of(context).size.width;
                    },
                  );
                },
                icon: selected
                    ? const Icon(Icons.arrow_drop_up)
                    : const Icon(Icons.arrow_drop_down),
              ),
              Visibility(
                visible: selected ? false : true,
                child: Column(
                  children: [
                    const SetWallpaperButtonsBar(),
                    PreviewBar(wallpaper: widget.wallpaper),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
