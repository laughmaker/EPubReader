//
//  UIView+WSK.m
//  CorePlotDemo
//
//  Created by 何 振东 on 12-9-26.
//  Copyright (c) 2012年 开趣. All rights reserved.
//

#import "UIView+Layer.h"
#import "QuartzCore/QuartzCore.h"

#define DEGREES_TO_RADIANS(d)   (d * M_PI / 180)

@implementation UIView (Layer)


+ (UIView *)reflectImage:(UIImage *)image withFrame:(CGRect)frame opacity:(CGFloat)opacity atView:(UIView *)view
{
	// Image Layer
	CALayer *imageLayer = [CALayer layer];
	imageLayer.contents = (id)image.CGImage;
    imageLayer.frame = frame;
    //	imageLayer.borderColor = [UIColor darkGrayColor].CGColor;
    //	imageLayer.borderWidth = 6.0;
	[view.layer addSublayer:imageLayer];
	
	// Reflection Layer
	CALayer *reflectionLayer = [CALayer layer];
	reflectionLayer.contents = imageLayer.contents;
    reflectionLayer.frame = CGRectMake(imageLayer.frame.origin.x, imageLayer.frame.origin.y + imageLayer.frame.size.height, imageLayer.frame.size.width, imageLayer.frame.size.height);
    //	reflectionLayer.borderColor = imageLayer.borderColor;
    //	reflectionLayer.borderWidth = imageLayer.borderWidth;
	reflectionLayer.opacity = opacity;
	// Transform X by 180 degrees
	[reflectionLayer setValue:[NSNumber numberWithFloat:DEGREES_TO_RADIANS(180)] forKeyPath:@"transform.rotation.x"];
    
	// Gradient Layer - Use as mask
	CAGradientLayer *gradientLayer = [CAGradientLayer layer];
	gradientLayer.bounds = reflectionLayer.bounds;
	gradientLayer.position = CGPointMake(reflectionLayer.bounds.size.width / 2, reflectionLayer.bounds.size.height * 0.5);
	gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor],(id)[[UIColor whiteColor] CGColor], nil];
	gradientLayer.startPoint = CGPointMake(0.5, 0.6);
	gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    
	// Add gradient layer as a mask
	reflectionLayer.mask = gradientLayer;
	[view.layer addSublayer:reflectionLayer];
    
    return view;
}

@end
