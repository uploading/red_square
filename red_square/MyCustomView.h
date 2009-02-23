//
//  MyCustomView.h
//  red_square
//
//  Created by Elizabeth Fuller on 2/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyCustomView : UIView {
	CGFloat				squareSize;
	CGFloat				rotation;
	CGColorRef			aColor;
	BOOL				twoFingers;
	
	IBOutlet UILabel	*xField;
	IBOutlet UILabel	*yField;
	IBOutlet UILabel	*zField;
}

@end
