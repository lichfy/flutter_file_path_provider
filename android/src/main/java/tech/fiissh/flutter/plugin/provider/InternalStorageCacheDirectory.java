package tech.fiissh.flutter.plugin.provider;

import android.content.Context;

class InternalStorageCacheDirectory extends FlutterDirectory {

    InternalStorageCacheDirectory(Context context) {
        super(context);
    }

    @Override
    protected String getMethodName() {
        return INTERNAL_STORAGE_CACHE_DIRECTOR;
    }

    @Override
    public String getDirectory() {
        return getContext().getCacheDir().getAbsolutePath();
    }
}
