package tech.fiissh.flutter.plugin.provider;

import android.content.Context;

class ExternalStorageCacheDirectory extends FlutterDirectory {

    ExternalStorageCacheDirectory(Context context) {
        super(context);
    }

    @Override
    protected String getMethodName() {
        return EXTERNAL_STORAGE_CACHE_DIRECTORY;
    }

    @Override
    public String getDirectory() {
        return getContext().getExternalCacheDir().getAbsolutePath();
    }
}