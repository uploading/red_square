//
//  red_squareAppDelegate.h
//  red_square
//
//  Created by Elizabeth Fuller on 2/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class red_squareViewController;

@interface red_squareAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    red_squareViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet red_squareViewController *viewController;

@end

