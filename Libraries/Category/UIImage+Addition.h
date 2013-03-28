//
//  UIImage+WSK.h
//  CorePlotDemo
//
//  Created by 何 振东 on 12-9-26.
//  Copyright (c) 2012年 开趣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (kai)

/**
 *  抓取屏幕。
 *  @param  scale:屏幕放大倍数，1为原尺寸。
 *  return  屏幕后的Image。
 */
+ (UIImage *)grabScreenWithScale:(CGFloat)scale;

/**
 *  抓取UIView及其子类。
 *  @param  view: UIView及其子类。
 *  @param  scale:屏幕放大倍数，1为原尺寸。
 *  return  抓取图片后的Image。
 */
+ (UIImage *)grabImageWithView:(UIView *)view scale:(CGFloat)scale;

/**
 *  合并两个Image。
 *  @param  image1、image2: 两张图片。
 *  @param  frame1、frame2:两张图片放置的位置。
 *  @param  size:返回图片的尺寸。
 *  return  合并后的两个图片的Image。
 */
+ (UIImage *)mergeWithImage1:(UIImage *)image1 image2:(UIImage *)image2 frame1:(CGRect)frame1 frame2:(CGRect)frame2 size:(CGSize)size;

/**
 *  把一个Image盖在另一个Image上面。
 *  @param  image: 底图。
 *  @param  mask:盖在上面的图。
 *  return  Image。
 */
+ (UIImage *)maskImage:(UIImage *)image withMask:(UIImage *)mask;

/**
 *  把一个Image尺寸缩放到另一个尺寸。
 *  @param  view: UIView及其子类。
 *  @param  scale:屏幕放大倍数，1为原尺寸。
 *  return  尺寸更改后的Image。
 */
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;



/**
 *  改变一个Image的色彩。
 *  @param  image: 被改变的Image。
 *  @param  color: 要改变的目标色彩。
 *  return  色彩更改后的Image。
 */
+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color;

//按frame裁减图片
+ (UIImage *)captureView:(UIView *)view frame:(CGRect)frame;




@end
