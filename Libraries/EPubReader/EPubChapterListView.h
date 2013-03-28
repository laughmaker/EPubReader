//
//  ChapterListView.h
//  FuYin
//
//  Created by line0 on 13-3-4.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

@class EPubChapter;
@protocol ChapterListViewDelegate <NSObject>

@required
- (void)selectChapter:(EPubChapter *)chapter;

@end


//显示章节列表

#import <UIKit/UIKit.h>

@interface EPubChapterListView : UIView
@property (weak, nonatomic) id <ChapterListViewDelegate> delegate;

//显示章节视图
@property (strong, nonatomic, readonly) UITableView    *tableView;
//章节数组
@property (strong, nonatomic, readonly) NSMutableArray *spineArray;

- (id)initWithFrame:(CGRect)frame andSpineArray:(NSArray *)spineArray;

@end
