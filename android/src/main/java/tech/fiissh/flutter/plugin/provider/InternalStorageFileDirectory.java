package tech.fiissh.flutter.plugin.provider;

import android.content.Context;

class InternalStorageFileDirectory extends FlutterDirectory {

    InternalStorageFileDirectory(Context context) {
        super(context);
    }

    @Override
    protected String getMethodName() {
        return INTERNAL_STORAGE_FILE_DIRECTOR;
    }

    @Override
    public String getDirectory() {
        return getContext().getFilesDir().getAbsolutePath();
    }
}
