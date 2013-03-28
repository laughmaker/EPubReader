//
//  Chapter.h
//
//  Created by line0 on 13-3-4.
//  Copyright (c) 2013年 wsk. All rights reserved.
//


#import <Foundation/Foundation.h>

//本类定义章节的数据结构，所有属性都在解析EPub文档时初始化写入。

@interface EPubChapter : NSObject
//章节的标题、目录完整路径、章节在整本书中的索引位置
@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) NSString  *spinePath;
@property (nonatomic, assign) NSInteger spineIndex;

@end
