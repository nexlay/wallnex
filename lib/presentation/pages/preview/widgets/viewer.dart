import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../common/ui/image/network_image_viewer.dart';
import '../../../provider/get_cropped_image_notifier.dart';

class PreviewViewer extends StatefulWidget {
  const PreviewViewer({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  State<PreviewViewer> createState() => _PreviewViewerState();
}

class _PreviewViewerState extends State<PreviewViewer> {
  late ScrollController controller;
  double maxScroll = 0.0;
  double minScroll = 0.0;
  double dx = 0.0;

  @override
  void initState() {
    controller = ScrollController()
      ..addListener(() {
        dx = controller.offset;
        maxScroll = controller.position.maxScrollExtent;
        minScroll = controller.position.minScrollExtent;
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GetCroppedImageNotifier>(
      builder: (_, provider, __) => NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            provider.path = widget.wallpaper.path;
            provider.dxOffset = dx;
          }
          return true;
        },
        child: SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          child: NetworkImageViewer(
            url: widget.wallpaper.path,
          ),
        ),
      ),
    );
  }
}
