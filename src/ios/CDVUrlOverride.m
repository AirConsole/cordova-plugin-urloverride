#import "CDVUrlOverride.h"
#import <Cordova/CDVPlugin.h>

@implementation CDVUrlOverride

// - (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
//     NSString* requestedUrl = [[request URL] absoluteString];
//     NSLog(@"shouldStartLoadWithRequest %@", requestedUrl);

//     if (navigationType == UIWebViewNavigationTypeLinkClicked) {
//       // NSString* jsMethodTemplate = @"linkHijackiOS.linkIntercepted('+++');";
//       // NSString* jsMethod = [jsMethodTemplate stringByReplacingOccurrencesOfString:@"+++" withString:requestedUrl];
//       // [self.webView stringByEvaluatingJavaScriptFromString:jsMethod];
//       return NO;
//     }
//     return [super webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
// }

- (BOOL)shouldOverrideLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = [request URL];

    NSLog(@"shouldStartLoadWithRequest %@", url);

    if (![[url scheme] isEqualToString:@"file"]) {
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
            return YES;
        }
    }

    return NO;
}

@end
