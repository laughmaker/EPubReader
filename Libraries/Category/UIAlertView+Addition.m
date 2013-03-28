//
//  UIAlertView+Addition.m
//  Line0
//
//  Created by line0 on 12-12-4.
//  Copyright (c) 2012年 line0. All rights reserved.
//

#import "UIAlertView+Addition.h"

@implementation UIAlertView (Addition)

+ (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
    [alertView show];
}



@end
