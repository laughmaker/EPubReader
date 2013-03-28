//
//  EPub
//
//  Created by line0 on 13-3-4.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouchXML.h"

//解析EPub，返回书的章节集合等属性


@interface EPubBook : NSObject
//书名
@property (nonatomic, readonly) NSString *bookName;
//章节集合数目
@property (nonatomic, readonly) NSArray  *spineArray;
//书文件路径
@property (nonatomic, readonly) NSString *bookPath;
//判断是否解析成功
@property (nonatomic, readonly) BOOL     parseSucceed;
//解压后书的基目录
@property (nonatomic, readonly) NSString *bookBasePath;

- (id)initWithEPubBookPath:(NSString *)bookPath;


@end
