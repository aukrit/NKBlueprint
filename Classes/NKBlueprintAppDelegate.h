//
//  NKBlueprintAppDelegate.h
//  NKBlueprint
//
//  Created by Mike Seaby on 11/05/2010.
//  Copyright Mike Seaby 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKBlueprintAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

