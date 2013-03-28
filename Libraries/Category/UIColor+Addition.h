//
//  UIColor+WSK.h
//  CTCockpit
//
//  Created by 何 振东 on 12-9-26.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

/**
 *  根据RGB返回UIColor。
 *  @param  red、green、blue:范围0—255。
 *  @param  alpha:透明度。
 *  return  UIColor。
 */
+ (UIColor *)red:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha;

/**
 *  根据UIColor返回RGB数组。
 *  @param  color:传递的参数。
 *  return  RGB数组
 */
+ (NSArray *)convertColorToRBG:(UIColor *)color;

/**
 *  根据十六进制颜色值返回UIColor。
 *  @param  hexColor:十六进制颜色值。
 *  return  UIColor。
 */
+ (UIColor *)convertHexColorToUIColor:(NSInteger)hexColor;


@end
