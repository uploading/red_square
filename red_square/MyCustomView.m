//
//  MyCustomView.m
//  red_square
//
//  Created by Elizabeth Fuller on 2/23/09.
//  Copyright 2009 Elizabeth Fuller. All rights reserved.
//

#import "MyCustomView.h"

#define kAccelerometerFrequency			10 //Hz


@implementation MyCustomView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void) awakeFromNib
{
	//inicialize view ere since it is instantiated by the nib
	squareSize = 100.0f;
	twoFingers = NO;
	rotation = 0.5f;
	// Explicitly turn on the multitouch for this view
	self.multipleTouchEnabled = YES;
	
	// configure for accelerometer
	[self configureAccelerometer];
}

- (void) configureAccelerometer
{
	UIAccelerometer*	theAccelerometer = [UIAccelerometer sharedAccelerometer];
	if(theAccelerometer) {
		theAccelerometer.updateInterval = 1 / kAccelerometerFrequency;
		theAccelerometer.delegate = self;
	}
	else {
		NSLog(@"Oops we're not running on the device!");
	}
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	UIAccelerationValue x, y, z;
	x = acceleration.x;
	y = acceleration.y;
	z = acceleration.z;
	
	// Do something with the values.
	xField.text = [NSString stringWithFormat:@"%.5f", x];
	yField.text = [NSString stringWithFormat:@"%.5f", y];
	zField.text = [NSString stringWithFormat:@"%.5f", z];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touches began cout %d, %@", [touches count], touches);
	
	if([touches count] > 1)
	{
		twoFingers = YES;
	}
	
	// tell the view to redraw
	[self setNeedsDisplay];
}

- (void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
	NSLog(@"touches moved count %d, %@", [touches count], touches);
	if([touches count] > 1)
	{
		// find initial slope between two fingers
		CGFloat initAngle = 0.1;
		// find updated slope between two fingers
		CGFloat newAngle = 0.2;
		// calculate change in angle
		CGFloat angleChange = initAngle - newAngle;
		// add change in angle to rotation
		rotation = rotation + angleChange;
	}
	// tel the view to redraw
	[self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touches moved count %d, %@", [touches count], touches);
	
	// reset the var
	twoFingers = NO;
	
	// tell the view to redraw
	[self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
	NSLog(@"drawRect");
	
	CGFloat centerx = rect.size.width/2;
	CGFloat centery = rect.size.height/2;
	CGFloat half = squareSize/2;
	CGRect theRect = CGRectMake(-half, -half, squareSize, squareSize);
	
	//Grab the drawing content
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// like Processing pushMatrix
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, centerx, centery);
	
	// Uncomment to see the rotated square
	CGContextRotateCTM(context, rotation);
	
	// Set red stroke
	CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
	
	// Set different based on multitouch
	if(!twoFingers) {
		CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
	}
	else {
		CGContextSetRGBFillColor(context, 0.0, 1.0, 1.0, 1.0);
	}
	
	// Draw a rect with a red stroke
	CGContextFillRect(context, theRect);
	CGContextStrokeRect(context, theRect);
	
	// like Processing popMatrix
	CGContextRestoreGState(context);
}


- (void)dealloc {
    [super dealloc];
}


@end
