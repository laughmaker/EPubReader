//
//  EPubView.h
//
//  Created by line0 on 13-3-4.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

//本类用来装载要显示的章节，因为一次装载整本书，会导致第一次加载时间过长。对本类的控制应通过EPubController类来操作。

#import <UIKit/UIKit.h>
@class Chapter;

@protocol EPubViewDelegate <NSObject>

@required
- (void)gotoPrevSpine;
- (void)gotoNextSpine;

@optional
- (void)epubViewLoadFinished;

@end


@interface EPubView : UIView
@property (nonatomic, weak)   id <EPubViewDelegate> delegate;
//用来承载文本
@property (nonatomic, readonly) UIWebView *webView;     
//当前显示的章节
@property (nonatomic, readonly) Chapter   *chapter;

//当前页在当前章节的索引值，从0开始
@property (nonatomic, readonly) int currentPageIndex;
//当前章节的页数
@property (nonatomic, readonly) int pageCount;
//文字字号大小
@property (nonatomic, assign)   int fontSize;           

//判断手势是上一章还是下一章，默认为YES，即为下一章。
@property (nonatomic, readonly, getter = isNext) BOOL next;


//装载章节
- (void)loadChapter:(Chapter *)chapter;
- (void)gotoPage:(int)pageIndex;
- (void)setFontSize:(int)fontSize;


@end


