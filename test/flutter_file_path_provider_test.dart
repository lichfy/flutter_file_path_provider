import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_file_path_provider/flutter_file_path_provider.dart';
import 'dart:io';

void main() {
  setUp(() {});

  tearDown(() {});

  test('getExternalStorageDirectory', () async {
    if (Platform.isAndroid) {
      FlutterFilePathResult flutterFilePathResult = await FlutterFilePathProvider.instance.getExternalStorageDirectory();
      expect(flutterFilePathResult.code, 0);
    }
  });

  test('getHomeDirectory', () async {
    if (Platform.isIOS) {
      FlutterFilePathResult flutterFilePathResult = await FlutterFilePathProvider.instance.getHomeDirectory();
      expect(flutterFilePathResult.code, 0);
    }
  });

  test('getExternalStorageTemporaryDirectory', () async {
    if (Platform.isIOS) {
      FlutterFilePathResult flutterFilePathResult = await FlutterFilePathProvider.instance.getExternalStorageTemporaryDirectory();
      expect(flutterFilePathResult.code, 0);
    }
  });

  test('getInternalStorageTemporaryDirectory', () async {
    if (Platform.isIOS) {
      FlutterFilePathResult flutterFilePathResult = await FlutterFilePathProvider.instance.getInternalStorageTemporaryDirectory();
      expect(flutterFilePathResult.code, 0);
    }
  });

  test('getExternalStorageCacheDirectory', () async {
    if (Platform.isIOS) {
      FlutterFilePathResult flutterFilePathResult = await FlutterFilePathProvider.instance.getExternalStorageCacheDirectory();
      expect(flutterFilePathResult.code, 0);
    }
  });
  test('getInternalStorageCacheDirectory', () async {
    if (Platform.isIOS) {
      FlutterFilePathResult flutterFilePathResult = await FlutterFilePathProvider.instance.getInternalStorageCacheDirectory();
      expect(flutterFilePathResult.code, 0);
    }
  });

  test('getExternalStorageFileDirectory', () async {
    if (Platform.isIOS) {
      FlutterFilePathResult flutterFilePathResult = await FlutterFilePathProvider.instance.getExternalStorageFileDirectory();
      expect(flutterFilePathResult.code, 0);
    }
  });

  test('getInternalStorageFileDirectory', () async {
    if (Platform.isIOS) {
      FlutterFilePathResult flutterFilePathResult = await FlutterFilePathProvider.instance.getInternalStorageFileDirectory();
      expect(flutterFilePathResult.code, 0);
    }
  });
}
