import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadProvider with ChangeNotifier {
  int downloadProgress = 0;
  ReceivePort receivePort = ReceivePort();

  Future<void> createEnqueue(String url) async {
    FlutterDownloader.registerCallback(callback);

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

  @pragma('vm:entry-point')
  static void callback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? sPort =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    sPort?.send([id, status, progress]);
  }

  Future<void> registerIsolate() async {
    IsolateNameServer.registerPortWithName(
        receivePort.sendPort, 'downloader_send_port');

    receivePort.listen((dynamic data) {
      downloadProgress = _getProgress(data[1], data[2]);
    });
  }

  int _getProgress(DownloadTaskStatus status, int progress) {
    switch (status.value) {
      case 0:
        downloadProgress = progress;
        notifyListeners();
        break;
      case 1:
        downloadProgress = progress;
        notifyListeners();
        break;
      case 2:
        downloadProgress = progress;
        notifyListeners();
        break;
      case 3:
        downloadProgress = progress;
        notifyListeners();
        break;
      case 4:
        downloadProgress = progress;
        notifyListeners();
        break;
      case 5:
        downloadProgress = progress;
        notifyListeners();
        break;
      case 6:
        downloadProgress = progress;
        notifyListeners();
        break;
      default:
        downloadProgress;
    }
    return downloadProgress;
  }

  void _dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  void reset() {
    downloadProgress = 0;
    notifyListeners();
  }
}
