#import "CDVUrlOverride.h"
#import <Cordova/CDVPlugin.h>

@implementation CDVUrlOverride

- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString* requestedUrl = [[request URL] absoluteString];
    NSLog(@"shouldStartLoadWithRequest %@", requestedUrl);

    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
      // NSString* jsMethodTemplate = @"linkHijackiOS.linkIntercepted('+++');";
      // NSString* jsMethod = [jsMethodTemplate stringByReplacingOccurrencesOfString:@"+++" withString:requestedUrl];
      // [self.webView stringByEvaluatingJavaScriptFromString:jsMethod];
      return NO;
    }
    return [super webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
}

@end
