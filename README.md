# flutter_file_path_provider

`flutter_file_path_provider` 是一款用于读取设备上存储目录的 `Flutter` 插件，同时支持 `Android` 和 `iOS` 两个平台。

该插件已经发布，使用信息请移步 [flutter_file_path_provider](https://pub.dev/packages/flutter_file_path_provider/versions/0.0.1#-readme-tab-)。

## Getting Started

第一步：在 `pubspec.yaml` 文件中声明需要使用的插件：

```
 dependencies:
   flutter_file_path_provider: ^0.0.2
``` 
 
第二步：使用如下命令安装插件：

```shell
$ flutter packages get
```
 
第三步：在项目中导入需要的文件：

```dart
import 'package:flutter_file_path_provider/flutter_file_path_provider.dart';
```

第四步：使用插件：

```dart
    FlutterFilePathProvider.instance.getExternalStorageDirectory().then((result) {
    // 处理结果
    });
```
   
## API 说明

* `getExternalStorageDirectory()` 返回设备的 `SD` 卡根目录，该方法只在 `Android` 平台有效，`iOS` 平台调用将会返回对应的错误信息。其对应 `Android` 平台上 `Environment.getExternalStorageDirectory().getAbsolutePath()` 的值 
* `getHomeDirectory()` 返回设备的沙盒根目录，该方法只在 `iOS` 平台有效，`Android` 平台调用将会返回对应的错误信息。其对应 `iOS` 平台上 `NSHomeDirectory()` 的值
* `getExternalStorageTemporaryDirectory()` 和 `getInternalStorageTemporaryDirectory()` 返回设备的临时目录。对于 `Android` 平台来说，两个方法分别对应 `String.format(getContext().getExternalCacheDir().getParent() + "%s", "/temp/")` 和 `String.format(getContext().getCacheDir().getParent() + "%s", "/temp/")` 的值，而对于 `iOS` 设备来说，则对应 `NSTemporaryDirectory()` 的值
* `getExternalStorageCacheDirectory()` 和 `getInternalStorageCacheDirectory()` 返回设备的缓存目录。对于 `Android` 平台来说，两个方法分别对应 `getContext().getExternalCacheDir().getAbsolutePath()` 和 `getContext().getCacheDir().getAbsolutePath()` 的值，而对于 `iOS` 平台，则对应 `NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject` 的值
* `getExternalStorageFileDirectory()` 和 `getInternalStorageFileDirectory()` 返回设备的存储目录。对于 `Android` 平台来说，两个方法分别对应 `String.format(getContext().getExternalCacheDir().getParentFile().getAbsolutePath() + "%s", "/files/")` 和 `getContext().getFilesDir().getAbsolutePath()` 的值，而对于 `iOS` 设备来说，则对应 `NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES).firstObject` 的值

## FlutterFilePathResult

`FlutterFilePathResult` 是结果的载体，其内部定义了用于表示错误码的 `code` 对象、表示错误信息的 `message` 对象和最终的结果 `directory` 对象。当且仅当 `code` 值为 0 时，`directory` 的值才有意义。

`code` 错误码：

* 0：返回成功
* 10：读到的结果为空
* 11：读取过程中出现异常
* 12：没有对应的方法
* 13: 不支持该方法
 