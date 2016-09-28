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
    NSLog(@"============================");
    NSLog(@"CDVUrlOverride logIt called");
    NSLog(@"%@", [command arguments]);
    NSString* myarg = [command argumentAtIndex:0];
    NSLog(@"%@", myarg);
    NSLog(@"============================");
}

@end
