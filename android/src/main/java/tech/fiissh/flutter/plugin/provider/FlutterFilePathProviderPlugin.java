package tech.fiissh.flutter.plugin.provider;

import android.text.TextUtils;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/**
 * FlutterFilePathProviderPlugin
 */
public class FlutterFilePathProviderPlugin implements MethodCallHandler {

    private static final String FLUTTER_FILE_PATH_PROVIDER_CHANNEL_NAME = "flutter_file_path_provider";
    private static Registrar registrar;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        FlutterFilePathProviderPlugin.registrar = registrar;
        final MethodChannel channel = new MethodChannel(registrar.messenger(), FLUTTER_FILE_PATH_PROVIDER_CHANNEL_NAME);
        channel.setMethodCallHandler(new FlutterFilePathProviderPlugin());
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        FlutterDirectory directory = FlutterDirectory.getDirectoryFactory(call.method, FlutterFilePathProviderPlugin.registrar.activeContext());

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
}
