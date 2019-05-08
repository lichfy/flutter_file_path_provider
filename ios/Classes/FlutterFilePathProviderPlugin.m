#import "FlutterFilePathProviderPlugin.h"

@implementation FlutterFilePathProviderPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"flutter_file_path_provider" binaryMessenger:[registrar messenger]];
  FlutterFilePathProviderPlugin* instance = [[FlutterFilePathProviderPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    
    NSString* method = call.method;
    
    if ([method isEqualToString: @"getInternalStorageTemporaryDirectory"] || [method isEqualToString:@"getExternalStorageTemporaryDirectory"]) {

        @try {
          
            NSString* temporaryDirectory = getInternalStorageTemporaryDirectory();

            if (temporaryDirectory == NULL || [temporaryDirectory isEqualToString: @""]) {
                
                FlutterError* error = [FlutterError errorWithCode:@"10" message:@"结果为空" details:@"结果为空"];
                result(error);
    
            } else {
                result(temporaryDirectory);
            }
        } @catch (NSException *exception) {
            
            FlutterError* error = [FlutterError errorWithCode:@"11" message:exception.description details:NULL];
            result(error);
        }
    } else if( [method isEqualToString: @"getInternalStorageCacheDirectory"] || [method isEqualToString:@"getExternalStorageCacheDirectory"] ) {
        
        @try {
            
            NSString* cacheDirectory = getInternalStorageCacheDirectory();

            if (cacheDirectory == NULL || [cacheDirectory isEqualToString: @""]) {
                
                FlutterError* error = [FlutterError errorWithCode:@"10" message:@"结果为空" details:NULL];
                result(error);
            } else {
                 result(cacheDirectory);
            }
        } @catch (NSException *exception) {
            
            FlutterError* error = [FlutterError errorWithCode:@"11" message:exception.description details:NULL];
            result(error);
        }
    } else if([method isEqualToString: @"getInternalStorageFileDirectory"] || [method isEqualToString:@"getExternalStorageFileDirectory"]){
        
        @try {
            
            NSString* fileDirectory = getInternalStorageFileDirectory();
            
            if (fileDirectory == NULL || [fileDirectory isEqualToString: @""]) {
                
                FlutterError* error = [FlutterError errorWithCode:@"10" message:@"结果为空" details:NULL];
                result(error);
            } else {
                result(fileDirectory);
            }
        } @catch (NSException *exception) {
        
            FlutterError* error = [FlutterError errorWithCode:@"11" message:exception.description details:NULL];
            result(error);
        }
    } else if([method isEqualToString:@"getHomeDirectory"]){
        
        @try {
        
            NSString* homeDirectory = getHomeDirectory();
            
            if (homeDirectory == NULL || [homeDirectory isEqualToString: @""]) {
               
                FlutterError* error = [FlutterError errorWithCode:@"10" message:@"结果为空" details:NULL];
                result(error);
            } else {
                result(homeDirectory);
            }
        } @catch (NSException *exception) {

            FlutterError* error = [FlutterError errorWithCode:@"11" message:exception.description details:NULL];
            result(error);
        }
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}

NSString* getInternalStorageTemporaryDirectory(){
    return NSTemporaryDirectory();
}

NSString* getInternalStorageCacheDirectory(){
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}

NSString* getInternalStorageFileDirectory(){
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES).firstObject;
}

NSString* getHomeDirectory(){
    return NSHomeDirectory();
}
@end
