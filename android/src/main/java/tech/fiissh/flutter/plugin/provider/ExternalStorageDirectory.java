package tech.fiissh.flutter.plugin.provider;

import android.content.Context;
import android.os.Environment;

class ExternalStorageDirectory extends FlutterDirectory {
    ExternalStorageDirectory(Context context) {
        super(context);
    }

    @Override
    protected String getMethodName() {
        return EXTERNAL_STORAGE_DIRECTORY;
    }

    @Override
    public String getDirectory() {
        return getContext().getExternalFilesDir(null).getAbsolutePath();
    }
}