//
//  UIColor+WSK.m
//  CTCockpit
//
//  Created by 何 振东 on 12-9-26.
//
//

#import "UIColor+Addition.h"

@implementation UIColor (Addition)

+ (UIColor *)red:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha
{
    UIColor *color = [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
    return color;
}

+ (NSArray *)convertColorToRBG:(UIColor *)uicolor
{
    CGColorRef color  = [uicolor CGColor];
    int numComponents = CGColorGetNumberOfComponents(color);
    NSArray *array = nil;
    
    if (numComponents == 4)
    {
        int rValue, gValue, bValue;
        const CGFloat *components = CGColorGetComponents(color);
        rValue = (int)(components[0] * 255);
        gValue = (int)(components[1] * 255);
        bValue = (int)(components[2] * 255);
        
        array = [NSArray arrayWithObjects:[NSNumber numberWithInt:rValue], [NSNumber numberWithInt:gValue], [NSNumber numberWithInt:bValue], nil];
    }
    
    return array;
}

UIColor* UIColorFromHex(NSInteger colorInHex)
{
    // colorInHex should be value like 0xFFFFFF
    return [UIColor colorWithRed:((float) ((colorInHex & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((colorInHex & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (colorInHex & 0xFF))            / 0xFF
                           alpha:1.0];
}

+ (UIColor *)convertHexColorToUIColor:(NSInteger)hexColor
{
    return [UIColor colorWithRed:((float) ((hexColor & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((hexColor & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (hexColor & 0xFF))            / 0xFF
                           alpha:1.0];
}

@end
