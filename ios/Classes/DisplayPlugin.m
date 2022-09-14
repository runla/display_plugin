#import "DisplayPlugin.h"
#if __has_include(<display_plugin/display_plugin-Swift.h>)
#import <display_plugin/display_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "display_plugin-Swift.h"
#endif

@implementation DisplayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDisplayPlugin registerWithRegistrar:registrar];
}
@end
