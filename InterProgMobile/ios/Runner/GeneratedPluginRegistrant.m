//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<animated_theme_switcher/AnimatedThemeSwitcherPlugin.h>)
#import <animated_theme_switcher/AnimatedThemeSwitcherPlugin.h>
#else
@import animated_theme_switcher;
#endif

#if __has_include(<flutter_facebook_auth/FlutterFacebookAuthPlugin.h>)
#import <flutter_facebook_auth/FlutterFacebookAuthPlugin.h>
#else
@import flutter_facebook_auth;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AnimatedThemeSwitcherPlugin registerWithRegistrar:[registry registrarForPlugin:@"AnimatedThemeSwitcherPlugin"]];
  [FlutterFacebookAuthPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterFacebookAuthPlugin"]];
}

@end
