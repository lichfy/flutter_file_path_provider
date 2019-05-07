package tech.fiissh.flutter.plugin.provider;

import android.content.Context;

class ExternalStorageTemporaryDirectory extends FlutterDirectory {
    ExternalStorageTemporaryDirectory(Context context) {
        super(context);
    }

    @Override
    protected String getMethodName() {
        return EXTERNAL_STORAGE_TEMPORARY_DIRECTORY;
    }

    @Override
    public String getDirectory() {
        return String.format(getContext().getExternalCacheDir().getParent() + "%s", "/temp/");
    }
}