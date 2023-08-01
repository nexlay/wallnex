import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadProvider extends ValueNotifier<int> {
  DownloadProvider() : super(0);

  final _receivePort = ReceivePort();

  @pragma('vm:entry-point')
  static void callback(String id, int status, int progress) {
    final SendPort sPort = IsolateNameServer.lookupPortByName('downloader')!;
    sPort.send([progress]);
  }

  static void registerFlutterDownloader() {
    FlutterDownloader.registerCallback(callback);
  }

  Future<void> createEnqueue(String url) async {
    await FlutterDownloader.enqueue(
      url: url,
      savedDir: '/storage/emulated/0/Download',
      saveInPublicStorage: true,
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification: true,
      // click on notification to open downloaded file (for Android)
    );
  }

  void listenPort() {
    IsolateNameServer.registerPortWithName(_receivePort.sendPort, 'downloader');
    _receivePort.asBroadcastStream().listen((message) {}).onData((data) {
      int progress = data[0];
      _getProgress(progress);
      notifyListeners();
    });

    registerFlutterDownloader();
  }

  void _getProgress(int progress) {
    value = progress;
    notifyListeners();
  }

  void resetDownloadStatus() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        value = 0;
        notifyListeners();
      },
    );
  }
}
