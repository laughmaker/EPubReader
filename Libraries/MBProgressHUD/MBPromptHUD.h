//
//  MBPromptHUD.h
//  HuiGouTong
//
//  Created by 何 振东 on 12-9-21.
//  Copyright (c) 2012年 何 振东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface MBPromptHUD : NSObject

+ (void)showPrompt:(NSString *)prompt atView:(UIView *)view;

- (void)showPrompt:(UIImage *)image withFrame:(CGRect)frame atView2:(UIView *)view;

+ (MBPromptHUD *)sharedMBPromptHUD;

@end
