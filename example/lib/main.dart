import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_file_path_provider/flutter_file_path_provider.dart';

void main() => runApp(FilePathProviderApplication());

class FilePathProviderApplication extends StatefulWidget {
  @override
  _FilePathProviderApplicationState createState() => _FilePathProviderApplicationState();
}

class _FilePathProviderApplicationState extends State<FilePathProviderApplication> {
  static const _EXTERNAL_STORAGE_DIRECTORY = 'getExternalStorageDirectory';
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

  String _directory = '请选择需要的功能';

  @override
  void initState() {
    super.initState();
  }

  String _getPlatformName() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else {
      return 'unKnown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text('plugin sample for ${_getPlatformName()}')), body: _buildApplicaitonBodyWidget()),
    );
  }

  Widget _buildApplicaitonBodyWidget() {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              new Padding(
                padding: EdgeInsets.all(3.0),
                child: RaisedButton(
                  onPressed: Platform.isAndroid ? _getExternalStorageDirectory : _getHomeDirectory,
                  child: Platform.isAndroid ? Text(_EXTERNAL_STORAGE_DIRECTORY) : Text(_HOME_DIRECTORY),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(3.0),
                child: RaisedButton(
                  onPressed: _getExternalStorageTemporaryDirectory,
                  child: Text(_EXTERNAL_STORAGE_TEMPORARY_DIRECTORY),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(3.0),
                child: RaisedButton(
                  onPressed: _getInternalStorageTemporaryDirectory,
                  child: Text(_INTERNAL_STORAGE_TEMPORARY_DIRECTORY),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(3.0),
                child: RaisedButton(
                  onPressed: _getExternalStorageCacheDirectory,
                  child: Text(_EXTERNAL_STORAGE_CACHE_DIRECTORY),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(3.0),
                child: RaisedButton(
                  onPressed: _getInternalStorageCacheDirectory,
                  child: Text(_INTERNAL_STORAGE_CACHE_DIRECTOR),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(3.0),
                child: RaisedButton(
                  onPressed: _getExternalStorageFileDirectory,
                  child: Text(_EXTERNAL_STORAGE_FILE_DIRECTORY),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(3.0),
                child: RaisedButton(
                  onPressed: _getInternalStorageFileDirectory,
                  child: Text(_INTERNAL_STORAGE_FILE_DIRECTOR),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(3.0),
                child: RaisedButton(
                  onPressed: _clearText,
                  child: Text('clear'),
                ),
              ),
              new Padding(
                child: Text(
                  _directory,
                  style: TextStyle(fontSize: 16),
                ),
                padding: EdgeInsets.all(10.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _getExternalStorageDirectory() async {
    FlutterFilePathProvider.instance.getExternalStorageDirectory().then((result) {
      _handlerResult(result);
    });
  }

  void _getHomeDirectory() async {
    FlutterFilePathProvider.instance.getHomeDirectory().then((result) {
      _handlerResult(result);
    });
  }

  void _getExternalStorageTemporaryDirectory() async {
    FlutterFilePathProvider.instance.getExternalStorageTemporaryDirectory().then((result) {
      _handlerResult(result);
    });
  }

  void _getInternalStorageTemporaryDirectory() async {
    FlutterFilePathProvider.instance.getInternalStorageTemporaryDirectory().then((result) {
      _handlerResult(result);
    });
  }

  void _getExternalStorageCacheDirectory() async {
    FlutterFilePathProvider.instance.getExternalStorageCacheDirectory().then((result) {
      _handlerResult(result);
    });
  }

  void _getInternalStorageCacheDirectory() async {
    FlutterFilePathProvider.instance.getInternalStorageCacheDirectory().then((result) {
      _handlerResult(result);
    });
  }

  void _getExternalStorageFileDirectory() async {
    FlutterFilePathProvider.instance.getExternalStorageFileDirectory().then((result) {
      _handlerResult(result);
    });
  }

  void _getInternalStorageFileDirectory() async {
    FlutterFilePathProvider.instance.getInternalStorageFileDirectory().then((result) {
      _handlerResult(result);
    });
  }

  void _handlerResult(FlutterFilePathResult result) {
    setState(() {
      if (result.code == 0) {
        _directory = result.directory.path;
      } else {
        _directory = '读取错误：${result.code}  ${result.message}';
      }
    });
  }

  void _clearText() {
    setState(() {
      _directory = '请选择需要的功能';
    });
  }
}
