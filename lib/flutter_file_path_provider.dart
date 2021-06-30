import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class FlutterFilePathProvider {
  factory FlutterFilePathProvider() => _getInstance();

  static FlutterFilePathProvider get instance => _getInstance();
  static FlutterFilePathProvider? _instance;
  static const _FLUTTER_FILE_PATH_PROVIDER_CHANNEL_NAME = 'flutter_file_path_provider';
  static const MethodChannel _channel = const MethodChannel(_FLUTTER_FILE_PATH_PROVIDER_CHANNEL_NAME);

  FlutterFilePathProvider._internal();

  static FlutterFilePathProvider _getInstance() {
    if (_instance == null) {
      _instance = new FlutterFilePathProvider._internal();
    }
    return _instance!;
  }

  // SD 卡根目录，只支持 Android
  static const String _EXTERNAL_STORAGE_DIRECTORY = 'getExternalStorageDirectory';

  // HomeDirectory，只支持 iOS
  static const String _HOME_DIRECTORY = 'getHomeDirectory';

  // 外部存储和内部存储的临时目录
  static const String _EXTERNAL_STORAGE_TEMPORARY_DIRECTORY = "getExternalStorageTemporaryDirectory";
  static const String _INTERNAL_STORAGE_TEMPORARY_DIRECTORY = "getInternalStorageTemporaryDirectory";

  // 外部存储和内部存储的缓存目录
  static const String _EXTERNAL_STORAGE_CACHE_DIRECTORY = "getExternalStorageCacheDirectory";
  static const String _INTERNAL_STORAGE_CACHE_DIRECTOR = "getInternalStorageCacheDirectory";

  // 外部存储和内部存储的文件目录
  static const String _EXTERNAL_STORAGE_FILE_DIRECTORY = "getExternalStorageFileDirectory";
  static const String _INTERNAL_STORAGE_FILE_DIRECTOR = "getInternalStorageFileDirectory";

  Future<FlutterFilePathResult> getExternalStorageDirectory() async {
    if (Platform.isIOS) {
      return new Future.value(new FlutterFilePathResult(null, "不支持该方法", 13));
    }
    return _getDirectory(_EXTERNAL_STORAGE_DIRECTORY);
  }

  Future<FlutterFilePathResult> getHomeDirectory() async {
    if (Platform.isAndroid) {
      return new Future.value(new FlutterFilePathResult(null, "不支持该方法", 13));
    }
    return _getDirectory(_HOME_DIRECTORY);
  }

  Future<FlutterFilePathResult> getExternalStorageTemporaryDirectory() async {
    return _getDirectory(_EXTERNAL_STORAGE_TEMPORARY_DIRECTORY);
  }

  Future<FlutterFilePathResult> getInternalStorageTemporaryDirectory() async {
    return _getDirectory(_INTERNAL_STORAGE_TEMPORARY_DIRECTORY);
  }

  Future<FlutterFilePathResult> getExternalStorageCacheDirectory() async {
    return _getDirectory(_EXTERNAL_STORAGE_CACHE_DIRECTORY);
  }

  Future<FlutterFilePathResult> getInternalStorageCacheDirectory() async {
    return _getDirectory(_INTERNAL_STORAGE_CACHE_DIRECTOR);
  }

  Future<FlutterFilePathResult> getExternalStorageFileDirectory() async {
    return _getDirectory(_EXTERNAL_STORAGE_FILE_DIRECTORY);
  }

  Future<FlutterFilePathResult> getInternalStorageFileDirectory() async {
    return _getDirectory(_INTERNAL_STORAGE_FILE_DIRECTOR);
  }

  Future<FlutterFilePathResult> _getDirectory(String methodName) async {
    try {
      final String result = await _channel.invokeMethod(methodName, null);

      if (result.isNotEmpty) {
        return new FlutterFilePathResult(new Directory(result.endsWith("/") ? result : '$result/'));
      } else {
        return new FlutterFilePathResult(null, "结果为空", 10);
      }
    } on MissingPluginException catch (missingPluginException) {
      // 找不到插件，该异常由设备平台调用 result.notImplemented(); 返回
      return new FlutterFilePathResult(null, missingPluginException.message??'', 12);
    } on FormatException catch (formatException) {
      // 格式化异常
      return new FlutterFilePathResult(null, formatException.message, 11);
    } on PlatformException catch (platformException) {
      // 从平台传递来的错误信息
      return new FlutterFilePathResult(null, platformException.message??'', int.parse(platformException.code));
    }
  }
}

class FlutterFilePathResult {
  Directory? directory;
  String message;

  // 0表示成功，即此时 directory 不为 null
  // 错误码由两部分组成，一部分是由设备平台传递过来的错误码，另一部分是 Flutter 端的错误码
  // 10：读到的结果为空，
  // 11：读取过程中出现异常，
  // 12：没有对应的方法
  // 13: 不支持该方法
  int code;

  FlutterFilePathResult(this.directory, [this.message = "", this.code = 0]);
}
