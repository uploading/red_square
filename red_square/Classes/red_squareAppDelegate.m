//
//  red_squareAppDelegate.m
//  red_square
//
//  Created by Elizabeth Fuller on 2/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "red_squareAppDelegate.h"
#import "red_squareViewController.h"

@implementation red_squareAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
