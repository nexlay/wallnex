
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../../common/ui/image/network_image_viewer.dart';
import '../../../../file_manager/presentation/provider/file_manager_notifier.dart';

class PreviewViewer extends StatefulWidget {
  const PreviewViewer({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  State<PreviewViewer> createState() => _PreviewViewerState();
}

class _PreviewViewerState extends State<PreviewViewer> {
  late ScrollController _controller;
  double _dx = 0.0;

  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        _dx = _controller.offset;
      });

    super.initState();
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FileManagerNotifier>(
      builder: (_, provider, __) => NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          provider.path = widget.wallpaper.path;
          provider.dxOffset = _dx;
          return true;
        },
        child: SingleChildScrollView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          child: NetworkImageViewer(
            url: widget.wallpaper.path,
          ),
        ),
      ),
    );
  }
}
