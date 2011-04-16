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
    
    // Fancy Fade/Zoom After Load 
    //*********************************
    UIImageView *splashView;  
} 

    // Fancy Fade/Zoom After Load 
    //********************************* 
- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context; // Fancy Fade/Zoom After Load

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

