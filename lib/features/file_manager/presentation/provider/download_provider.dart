import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

@pragma('vm:entry-point')
void _downloadCallback(String id, int status, int progress) {
  final SendPort sPort = IsolateNameServer.lookupPortByName('downloader')!;
  sPort.send([status, progress]);
}

class DownloadProvider extends ValueNotifier<int> {
  DownloadProvider() : super(0);

  final _receivePort = ReceivePort();

  static void registerFlutterDownloader() {
    FlutterDownloader.registerCallback(_downloadCallback);
  }

  Future<void> createEnqueue(String url) async {
    await FlutterDownloader.enqueue(
      url: url,
      savedDir: '/storage/emulated/0/Download',
      saveInPublicStorage: true,
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  void listenPort() {
    IsolateNameServer.registerPortWithName(_receivePort.sendPort, 'downloader');
    _receivePort.asBroadcastStream().listen((data) {
      final status = _statusFromInt(data[0]);
      final progress = data[1];
      _updateProgress(status, progress);
    });

    registerFlutterDownloader();
  }

  void _updateProgress(DownloadTaskStatus status, int progress) {
    if (status == DownloadTaskStatus.running) {
      value = progress;
    } else if (status == DownloadTaskStatus.complete) {
      value = 100;
    } else if (status == DownloadTaskStatus.failed) {
      value = -1;
    }
    notifyListeners();
  }

  void resetDownloadStatus() {
    value = 0;
    notifyListeners();
  }

  DownloadTaskStatus _statusFromInt(int value) {
    switch (value) {
      case 0:
        return DownloadTaskStatus.undefined;
      case 1:
        return DownloadTaskStatus.enqueued;
      case 2:
        return DownloadTaskStatus.running;
      case 3:
        return DownloadTaskStatus.complete;
      case 4:
        return DownloadTaskStatus.failed;
      case 5:
        return DownloadTaskStatus.canceled;
      case 6:
        return DownloadTaskStatus.paused;
      default:
        return DownloadTaskStatus.undefined;
    }
  }
}
