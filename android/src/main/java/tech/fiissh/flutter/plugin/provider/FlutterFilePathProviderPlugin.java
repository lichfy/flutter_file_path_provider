package tech.fiissh.flutter.plugin.provider;

import android.content.Context;
import android.text.TextUtils;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * FlutterFilePathProviderPlugin
 */
public class FlutterFilePathProviderPlugin implements FlutterPlugin, MethodCallHandler {

    private static final String FLUTTER_FILE_PATH_PROVIDER_CHANNEL_NAME = "flutter_file_path_provider";
    private Context context;

    @Override
    public void onMethodCall(MethodCall call, @NonNull Result result) {
        FlutterDirectory directory = FlutterDirectory.getDirectoryFactory(call.method, context);

        if (directory == null) {
            result.notImplemented();
        } else {
            try {
                String directoryResult = directory.getDirectory();
                if (!TextUtils.isEmpty(directoryResult)) {
                    result.success(directoryResult);
                } else {
                    result.error("10", "结果为空", null);
                }
            } catch (Exception e) {
                result.error("11", e.getLocalizedMessage(), null);
            }
        }
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        context = binding.getApplicationContext();
        final MethodChannel channel = new MethodChannel(binding.getBinaryMessenger(), FLUTTER_FILE_PATH_PROVIDER_CHANNEL_NAME);
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {

    }
}
