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

@end
