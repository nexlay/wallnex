import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/exceptions/exceptions.dart';

class DownloadProvider extends ValueNotifier<int> {
  DownloadProvider() : super(0);

  final _receivePort = ReceivePort();
  bool _isolateRegistered = false;

  @pragma('vm:entry-point')
  static void callback(String id, DownloadTaskStatus status, int progress) {
    final SendPort sPort = IsolateNameServer.lookupPortByName('downloader')!;
    sPort.send([progress]);
  }

  Future<void> createEnqueue(String url) async {
    await FlutterDownloader.registerCallback(callback);
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

  Future<void> registerIsolate() async {
    _isolateRegistered = IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, 'downloader');
  }

  Future<void> listenPort() async {
    if (_isolateRegistered) {
      try {
        _receivePort.asBroadcastStream().listen((message) {}).onData((data) {
          int progress = data[0];
          _getProgress(progress);
          notifyListeners();
        });
      } on LocalExceptions {
        LocalFailure().toString();
      }
    } else {
      registerIsolate();
    }
  }

  void _getProgress(int progress) {
    value = progress;
    notifyListeners();
  }

  void resetDownloadStatus() {
    value = 0;
    notifyListeners();
  }
}
