package tech.fiissh.flutter.plugin.provider;

import android.content.Context;
import android.os.Environment;

class ExternalStorageFlutterDirectory extends FlutterDirectory {
    ExternalStorageFlutterDirectory(Context context) {
        super(context);
    }

    @Override
    protected String getMethodName() {
        return EXTERNAL_STORAGE_DIRECTORY;
    }

    @Override
    public String getDirectory() {
        return Environment.getExternalStorageDirectory().getAbsolutePath();
    }
}