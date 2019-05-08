import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_file_path_provider/flutter_file_path_provider.dart';
import 'dart:io';

void main() {
  const _FLUTTER_FILE_PATH_PROVIDER_CHANNEL_NAME = 'flutter_file_path_provider';
  const MethodChannel _channel = MethodChannel(_FLUTTER_FILE_PATH_PROVIDER_CHANNEL_NAME);

  FlutterFilePathProvider flutterFilePathProvider = new FlutterFilePathProvider();

  setUp(() {});

  tearDown(() {});

  test('getExternalStorageDirectory', () async {
    expect(await flutterFilePathProvider.getExternalStorageDirectory(), FlutterFilePathResult);
  });

//  test('getExternalStorageTemporaryDirectory', () async {
//    expect(await flutterFilePathProvider.getExternalStorageTemporaryDirectory(), null);
//  });
}
