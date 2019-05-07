package tech.fiissh.flutter.plugin.provider;

import android.content.Context;

class ExternalStorageFileDirectory extends FlutterDirectory {

    ExternalStorageFileDirectory(Context context) {
        super(context);
    }

    @Override
    protected String getMethodName() {
        return EXTERNAL_STORAGE_FILE_DIRECTORY;
    }

    @Override
    public String getDirectory() {
        return String.format(getContext().getExternalCacheDir().getParentFile().getAbsolutePath() + "%s", "/files/");
    }
}
