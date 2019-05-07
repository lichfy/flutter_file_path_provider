package tech.fiissh.flutter.plugin.provider;

import android.content.Context;
import android.text.TextUtils;

abstract class FlutterDirectory implements IFlutterDirectory<String> {

    // SD 卡根目录
    static final String EXTERNAL_STORAGE_DIRECTORY = "getExternalStorageDirectory";

    // 外部存储和内部存储的临时目录
    static final String EXTERNAL_STORAGE_TEMPORARY_DIRECTORY = "getExternalStorageTemporaryDirectory";
    static final String INTERNAL_STORAGE_TEMPORARY_DIRECTORY = "getInternalStorageTemporaryDirectory";

    // 外部存储和内部存储的缓存目录
    static final String EXTERNAL_STORAGE_CACHE_DIRECTORY = "getExternalStorageCacheDirectory";
    static final String INTERNAL_STORAGE_CACHE_DIRECTOR = "getInternalStorageCacheDirectory";

    // 外部存储和内部存储的文件目录
    static final String EXTERNAL_STORAGE_FILE_DIRECTORY = "getExternalStorageFileDirectory";
    static final String INTERNAL_STORAGE_FILE_DIRECTOR = "getInternalStorageFileDirectory";
    private Context context;

    protected abstract String getMethodName();

    protected FlutterDirectory(Context context) {
        this.context = context;
    }

    public Context getContext() {
        return context;
    }

    static FlutterDirectory getDirectoryFactory(String method, Context context) {
        FlutterDirectory directory = null;
        if (TextUtils.equals(method, EXTERNAL_STORAGE_DIRECTORY)) {
            directory = new ExternalStorageFlutterDirectory(context);
        } else if (TextUtils.equals(method, EXTERNAL_STORAGE_TEMPORARY_DIRECTORY)) {
            directory = new ExternalStorageTemporaryDirectory(context);
        } else if (TextUtils.equals(method, INTERNAL_STORAGE_TEMPORARY_DIRECTORY)) {
            directory = new InternalStorageTemporaryDirectory(context);
        } else if (TextUtils.equals(method, EXTERNAL_STORAGE_CACHE_DIRECTORY)) {
            directory = new ExternalStorageCacheDirectory(context);
        } else if (TextUtils.equals(method, INTERNAL_STORAGE_CACHE_DIRECTOR)) {
            directory = new InternalStorageCacheDirectory(context);
        } else if (TextUtils.equals(method, EXTERNAL_STORAGE_FILE_DIRECTORY)) {
            directory = new ExternalStorageFileDirectory(context);
        } else if (TextUtils.equals(method, INTERNAL_STORAGE_FILE_DIRECTOR)) {
            directory = new InternalStorageFileDirectory(context);
        }

        return directory;
    }
}
