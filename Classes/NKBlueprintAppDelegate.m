//
//  NKBlueprintAppDelegate.m
//  NKBlueprint
//
//  Created by Mike Seaby on 11/05/2010.
//  Copyright Mike Seaby 2010. All rights reserved.
//

#import "NKBlueprintAppDelegate.h"
#import "Nimble.h"
#import "NKBridge.h"

extern BOOL _mainWebViewLoaded;

@implementation NKBlueprintAppDelegate

@synthesize window;

// Fancy Fade/Zoom After Load 
//*********************************
- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {  
    [splashView removeFromSuperview];  
    [splashView release];  
}  

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	Nimble *nimble = [[Nimble alloc] initWithRootPage:@"main.html" window:window serial:@""];
	[nimble release];
	[window makeKeyAndVisible];
	while (!_mainWebViewLoaded) {
		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
	}
    
    // Fancy Fade/Zoom After Load 
    //*********************************
    splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 320, 480)];  
    splashView.image = [UIImage imageNamed:@"Default.png"];  
    [window addSubview:splashView];  
    [window bringSubviewToFront:splashView];  
    [UIView beginAnimations:nil context:nil];  
    [UIView setAnimationDuration:2.0];  
    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];  
    [UIView setAnimationDelegate:self];   
    [UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];  
    splashView.alpha = 0.0;  
    splashView.frame = CGRectMake(-60, -85, 440, 635);  
    [UIView commitAnimations]; 
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	[[NKBridge sharedInstance] performSelector:@selector(onApplicationQuit)];
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

