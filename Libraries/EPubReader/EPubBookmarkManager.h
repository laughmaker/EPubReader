//
//  BookMarkManager.h
//  FuYin
//
//  Created by line0 on 13-3-9.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EPubBookmark.h"

//书签管理器，所有书的书签存在一个数据库里，不同的书签存在一个独立的表里，bookName作为书签表的名字。

@interface EPubBookmarkManager : NSObject

- (id)initWithBookName:(NSString *)bookName;

- (BOOL)addBookmark:(EPubBookmark *)bookmark;
- (BOOL)deleteBookmark:(EPubBookmark *)bookmark;
- (NSArray *)allBookmark;
- (EPubBookmark *)lastBookmark;
- (NSInteger)lastBookmarkID;

@end
