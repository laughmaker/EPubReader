//
//  Created by line0 on 13-3-4.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

//本类定义书签的数据结构

#import <Foundation/Foundation.h>

@interface EPubBookmark : NSObject

@property (nonatomic, readonly) NSInteger bookmarkID;         //书签的ID号,用以对书签的修改.
@property (nonatomic, strong)   NSString  *markName;          //书签名，取当前章节标题
@property (nonatomic, strong)   NSString  *description;       //书签描述,截取当前页的开始20个字符
@property (nonatomic, strong)   NSDate    *addTime;           //添加书签的时间
@property (nonatomic, assign)   NSInteger pageIndexInSpine;   //此页在章节中的索引值，从0开始
@property (nonatomic, assign)   NSInteger spineIndex;         //书签所在章节索引值,从0开始

- (id)initWithBookmarkID:(NSInteger)bookmarkID;

@end
