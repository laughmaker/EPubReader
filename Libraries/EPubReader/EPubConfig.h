//
//  EPubDefine.h
//
//  Created by line0 on 13-3-4.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kAPPName    [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kDocuments  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

//数据库地址，用于保存书签等
#define kEPubDBPath     [NSString stringWithFormat:@"%@/%@", kDocuments, @"EPub.db"]

