import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../../common/ui/loading_status/loader.dart';
import '../../../../file_manager/presentation/provider/file_manager_notifier.dart';

class PreviewViewer extends StatefulWidget {
  const PreviewViewer({Key? key, required this.wallpaper}) : super(key: key);
  final Wallpaper wallpaper;

  @override
  State<PreviewViewer> createState() => _PreviewViewerState();
}

class _PreviewViewerState extends State<PreviewViewer> {
  late PhotoViewController _controller;
  late String _path;
  double _dx = 0.0;

  @override
  void initState() {
    _controller = PhotoViewController()..outputStateStream.listen(listener);
    _path = widget.wallpaper.path;
    super.initState();
  }

  void listener(PhotoViewControllerValue value) {
    setState(() {
      _dx = value.position.dx;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FileManagerNotifier>(
      builder: (_, provider, __) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          provider.path = _path;
          provider.dxOffset = _dx;
        });
        return PhotoView(
          controller: _controller,
          basePosition: Alignment.centerLeft,
          initialScale: PhotoViewComputedScale.covered,
          minScale: PhotoViewComputedScale.covered,
          maxScale: PhotoViewComputedScale.covered,
          loadingBuilder: (_, __) => const Loader(),
          imageProvider: CachedNetworkImageProvider(_path),
        );
      }
    );
  }
}
