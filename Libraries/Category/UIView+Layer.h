//
//  UIView+WSK.h
//  CorePlotDemo
//
//  Created by 何 振东 on 12-9-26.
//  Copyright (c) 2012年 开趣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layer)

/**
 *  产生一个Image的倒影，并把这个倒影图片加在一个View上面。
 *  @param  image:被倒影的原图。
 *  @param  frame:盖在上面的图。
 *  @param  opacity:倒影的透明度，0为完全透明，即倒影不可见;1为完全不透明。
 *  @param  view:倒影加载在上面。
 *  return  产生倒影后的View。
 */
+ (UIView *)reflectImage:(UIImage *)image withFrame:(CGRect)frame opacity:(CGFloat)opacity atView:(UIView *)view;

@end
