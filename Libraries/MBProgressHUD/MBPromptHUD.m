//
//  MBPromptHUD.m
//  HuiGouTong
//
//  Created by 何 振东 on 12-9-21.
//  Copyright (c) 2012年 何 振东. All rights reserved.
//

#import "MBPromptHUD.h"

@interface MBPromptHUD ()

@property (retain, nonatomic) UIImageView *alertImgView;
@end

@implementation MBPromptHUD
@synthesize alertImgView;


+ (void)showPrompt:(NSString *)prompt atView:(UIView *)view
{
	MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
	
	hud.mode      = MBProgressHUDModeText;
	hud.labelText = prompt;
	hud.margin    = 10.f;
	hud.yOffset   = -85.f;
    hud.opacity   = 0.4;
	hud.removeFromSuperViewOnHide = YES;
	[hud hide:YES afterDelay:1.15];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        alertImgView = [[UIImageView alloc] init];
        self.alertImgView.backgroundColor = [[UIColor darkTextColor] colorWithAlphaComponent:0.6];
    }
    return self;
}


+ (MBPromptHUD *)sharedMBPromptHUD
{
    static MBPromptHUD *promptHUD = nil;
    
    @synchronized(self)
    {
        if (!promptHUD)
        {
            promptHUD = [[MBPromptHUD alloc] init];
        }
    }
    
    return promptHUD;
}

- (void)showPrompt:(UIImage *)image withFrame:(CGRect)frame atView2:(UIView *)view{

    self.alertImgView.frame = frame;
    self.alertImgView.image = image;
    [view addSubview:self.alertImgView];
    
    [UIView beginAnimations:nil context:nil];
    self.alertImgView.alpha = 1.0f;
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:2.0f];
    [UIView commitAnimations];
    
    [self performSelector:@selector(hidePromptView) withObject:nil afterDelay:2.0];
}
- (void)hidePromptView
{
    [UIView beginAnimations:nil context:nil];
    self.alertImgView.alpha = 0.0;
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:2.0f];
    [UIView commitAnimations];
}


@end
