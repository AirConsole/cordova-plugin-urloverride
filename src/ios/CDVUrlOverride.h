/********* CDVUrlOverride.h Cordova Plugin Header *******/

#import <Cordova/CDVPlugin.h>

@interface CDVUrlOverride : CDVPlugin

- (BOOL)shouldOverrideLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType;

@end
