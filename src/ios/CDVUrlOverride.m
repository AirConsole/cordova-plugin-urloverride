#import "CDVUrlOverride.h"
#import <Cordova/CDVPlugin.h>

@implementation CDVUrlOverride

- (BOOL)shouldOverrideLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *url = [request URL];
    NSLog(@"shouldStartLoadWithRequest %@", url);

    if (![[url scheme] isEqualToString:@"file"]) {
        if ([url isEqual:request.mainDocumentURL]) {
            NSLog(@"CDVUrlOverride return NO");
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                   [[UIApplication sharedApplication] openURL:url];
                return NO;
            }
        }
    }

    return YES;
}

- (void)logIt:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* myarg = [command.arguments objectAtIndex:0];

    NSLog(@"============================");
    NSLog(@"CDVUrlOverride logIt callled");
    NSLog(@"============================");

    if (myarg != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
