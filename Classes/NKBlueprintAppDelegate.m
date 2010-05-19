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


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	Nimble *nimble = [[Nimble alloc] initWithRootPage:@"main.html" window:window serial:@""];
	[nimble release];
	[window makeKeyAndVisible];
	while (!_mainWebViewLoaded) {
		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
	}	
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
