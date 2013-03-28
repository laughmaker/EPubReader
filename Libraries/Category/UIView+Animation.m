//
//  UIView+Animation.m
//  StringDemo
//
//  Created by 何 振东 on 12-10-11.
//  Copyright (c) 2012年 wsk. All rights reserved.
//

#import "UIView+Animation.h"


#define kTransitionTime 0.55
#define kFlipTime       0.85


@implementation UIView (Animation)

+ (void)animationReveal:(UIView *)view direction:(NSString *)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setType:kCATransitionReveal];
    [animation setSubtype:direction];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)animationFade:(UIView *)view
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setType:kCATransitionFade];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)animationRotateAndScaleDownUp:(UIView *)view
{
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 2];
	rotationAnimation.duration = 0.750f;
	rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	scaleAnimation.toValue = [NSNumber numberWithFloat:0.0];
	scaleAnimation.duration = 0.75f;
	scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
	animationGroup.duration = 0.75f;
	animationGroup.autoreverses = YES;
	animationGroup.repeatCount = 1;//HUGE_VALF;
	[animationGroup setAnimations:[NSArray arrayWithObjects:rotationAnimation, scaleAnimation, nil]];
    
	[view.layer addAnimation:animationGroup forKey:@"animationGroup"];
}


+ (void)animationFlip:(UIView *)view direction:(NSString *)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kFlipTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"oglFlip"];
    [animation setSubtype:direction];
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)animationPush:(UIView *)view direction:(NSString *)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:kCATransitionPush];
    [animation setSubtype:direction];
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)animationCurl:(UIView *)view direction:(NSString *)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"pageCurl"];
    [animation setSubtype:direction];
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)animationUnCurl:(UIView *)view direction:(NSString *)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"pageUnCurl"];
    [animation setSubtype:direction];
    
    [view.layer addAnimation:animation forKey:nil];
}

+(void)animationRotateAndScaleEffects:(UIView *)view
{
    [UIView animateWithDuration:0.75
                     animations:^
     {
         view.transform = CGAffineTransformMakeScale(0.001, 0.001);
         
         CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
         animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.70, 0.40, 0.80) ];//旋转形成一道闪电。
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.0, 1.0, 0.0) ];//y轴居中对折番。
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 1.0, 0.0, 0.0) ];//沿X轴对折翻转。
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.50, -0.50, 0.50) ];
         //animation.toValue = [ NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI, 0.1, 0.2, 0.2) ];
         
         animation.duration = 0.45;
         animation.repeatCount = 1;
         [view.layer addAnimation:animation forKey:nil];
         
     }
                     completion:^(BOOL finished)
     {
         [UIView animateWithDuration:0.75 animations:^
          {
              view.transform = CGAffineTransformMakeScale(1.0, 1.0);
          }
          ];
         
     }
     ];
}


+ (void)animationMove:(UIView *)view direction:(NSString *)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:kCATransitionMoveIn];
    [animation setSubtype:direction];
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)animationCube:(UIView *)view direction:(NSString *)direction
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"cube"];
    [animation setSubtype:direction];
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)animationRippleEffect:(UIView *)view
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"rippleEffect"];
    [animation setSubtype:kCATransitionFromRight];
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)animationCameraEffect:(UIView *)view type:(NSString *)type
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:type];
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)animationSuckEffect:(UIView *)view
{
    CATransition *animation = [CATransition animation];
    [animation setDuration:kTransitionTime];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [animation setType:@"suckEffect"];
    [animation setSubtype:kCATransitionFromRight];
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)animationBounceIn:(UIView *)view
{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.0001];
    [view setAlpha:0.8];
	[view setTransform:CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1)];
	[UIView commitAnimations];
}

+ (void)animationBounceOut:(UIView *)view
{
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.73];
//    [UIView setAnimationDelay:0.2];
    [view setAlpha:1.0];
	[view setTransform:CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)];
	[UIView commitAnimations];
}

+ (void)animationBounce:(UIView *)view
{
    CGRect rect = view.bounds;
    CGPoint center = view.center;
    [view setCenter:CGPointMake(160, 240)];
    [view setFrame:CGRectZero];
    
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.75];
    [view setAlpha:1.0];
    [view setBounds:rect];
    [view setCenter:center];
	[UIView commitAnimations];
}

@end
