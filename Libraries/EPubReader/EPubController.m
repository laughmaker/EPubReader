//
//  DetailViewController.m
//
//  Created by line0 on 13-3-4.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

#import "EPubController.h"
#import "EPubChapter.h"
#import "EPubBook.h"
#import "EPubView.h"
#import "MBProgressHUD.h"
#import "MBPromptHUD.h"
#import "EPubChapterListView.h"
#import "EPubBookmarkManager.h"


@interface EPubController() <EPubViewDelegate, ChapterListViewDelegate>
//展示EPubView的父视图
@property (strong, readonly) UIView *epubParentView;
//跳转页码
@property (assign, nonatomic) NSInteger gotoPage;
@property (strong, nonatomic) EPubBookmarkManager *bookmarkManager;


@end


@implementation EPubController


#pragma mark - Loading

- (void)showLoadingView
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.epubParentView animated:YES];
    [hud setDimBackground:YES];
    [hud setLabelText:@"请稍等..."];
    [hud setOpacity:0.4];
}

- (void)hideLoadingView
{
    [MBProgressHUD hideAllHUDsForView:self.epubParentView animated:YES];
}


#pragma mark - Epub

- (void)openBook:(NSString *)bookPath atView:(UIView *)view withPageFrame:(CGRect)pageFrame
{
    _epubParentView = view;
    _epubBook = [[EPubBook alloc] initWithEPubBookPath:bookPath];
    if (_epubBook.parseSucceed)
    {
        if (!_epubView)
        {
            [self showLoadingView];

            _epubView = [[EPubView alloc] initWithFrame:pageFrame];
            [self.epubView setDelegate:self];
            [self.epubView loadChapter:[self.epubBook.spineArray objectAtIndex:0]];
            [view addSubview:self.epubView];
        }
        [self.epubView setHidden:NO];
    }
    
    self.bookmarkManager = [[EPubBookmarkManager alloc] initWithBookName:self.epubBook.bookName];
}

- (void)closeBook
{
    [self.epubView setHidden:YES];
    _epubBook = nil;
    _epubView = nil;
    _epubParentView = nil;
    _currentSpineIndex = 0;
    _totalPagesCount = 0;
    self.bookmarkManager = nil;
}

- (void)showChapterListAtView:(UIView *)view withFrame:(CGRect)rect
{
    if (!_chapterListView)
    {
        _chapterListView = [[EPubChapterListView alloc] initWithFrame:rect andSpineArray:self.epubBook.spineArray];
        [self.chapterListView setDelegate:self];
        [view addSubview:self.chapterListView];
    }
    [self.chapterListView setFrame:rect];
    [self.chapterListView setHidden:NO];
}

- (void)hideChapterListView
{
    [self.chapterListView setHidden:YES];
}


#pragma mark - ChapterListView Delegate

- (void)selectChapter:(EPubChapter *)chapter
{
    [self gotoPage:0 inSpine:chapter.spineIndex];
    
    [self hideChapterListView];
}


#pragma mark - EPubView Delegate Method

- (void)gotoPrevSpine
{
    if (_currentSpineIndex > 0)
    {
        [self gotoPage:0 inSpine:--_currentSpineIndex];
    }
}

- (void)gotoNextSpine
{
    if (_currentSpineIndex < self.epubBook.spineArray.count - 1)
        [self gotoPage:0 inSpine:++_currentSpineIndex];
}

- (void)epubViewLoadFinished
{
    [self hideLoadingView];
    
    if (self.epubView.next)
        [self gotoPageInCurrentSpine:0];
    else
        [self gotoPageInCurrentSpine:self.epubView.pageCount - 1];
}


#pragma mark - Read Control

- (void)gotoPageInCurrentSpine:(int)pageIndex
{
    [self.epubView gotoPage:pageIndex];
}

- (void)gotoPage:(int)pageIndex inSpine:(int)spineIndex
{
    _currentSpineIndex = spineIndex;
    self.gotoPage = pageIndex;
    Chapter *chapter = [self.epubBook.spineArray objectAtIndex:spineIndex];
    [self.epubView loadChapter:chapter];

    [self showLoadingView];
}


#pragma mark - BookMark

- (void)addBookmark
{
    NSInteger lastbookmarkID = [self.bookmarkManager lastBookmarkID];
    EPubBookmark *bookmark = [[EPubBookmark alloc] initWithBookmarkID:lastbookmarkID + 1];
    bookmark.markName = @"杀身成仁，舍身取义";
    bookmark.addTime = [NSDate date];
    bookmark.pageIndexInSpine = 2;
    bookmark.spineIndex = 3;
    [self.bookmarkManager addBookmark:bookmark];
    
    NSLog(@"bookmarkName:%@", [self.bookmarkManager lastBookmark].markName);
}

- (void)deleteBookmark:(EPubBookmark *)bookmark
{

}


@end
