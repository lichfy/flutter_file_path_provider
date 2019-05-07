package tech.fiissh.flutter.plugin.provider;

import android.content.Context;

class InternalStorageTemporaryDirectory extends FlutterDirectory {

    InternalStorageTemporaryDirectory(Context context) {
        super(context);
    }

    @Override
    protected String getMethodName() {
        return INTERNAL_STORAGE_TEMPORARY_DIRECTORY;
    }

    @Override
    public String getDirectory() {
        return String.format(getContext().getCacheDir().getParent() + "%s", "/temp/");
    }
}