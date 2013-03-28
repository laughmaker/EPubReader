//
//  BookMarkManager.m
//  FuYin
//
//  Created by line0 on 13-3-9.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

#import "EPubBookmarkManager.h"
#import "FMDatabase.h"
#import "NSDate+Addition.h"
#import "EPubConfig.h"


@interface EPubBookmarkManager ()
@property (strong, nonatomic) FMDatabase *db;
@property (strong, nonatomic) NSString   *tableName;

@end

@implementation EPubBookmarkManager

- (id)initWithBookName:(NSString *)bookName
{
    self = [self init];
    self.tableName = bookName;
    self.db = [FMDatabase databaseWithPath:kEPubDBPath];
    [self creatBookmarkTable];

    return self;
}

- (BOOL)creatBookmarkTable
{
    NSString *sqlKey = @"bookmarkID integer primary key, bookmark blob";
    BOOL result = NO;
    if ([self.db open])
    {
        NSString *sql = [NSString stringWithFormat:@"create table if not exists %@ (%@)", self.tableName, sqlKey];
        result = [self.db executeUpdate:sql];
        if ([self.db hadError])
            NSLog(@"error:%@", [self.db lastError]);
    }
    [self.db close];

    return result;
}

- (NSInteger)lastBookmarkID
{
    NSString *sql = [NSString stringWithFormat:@"SELECT bookmarkID FROM %@", self.tableName];
    FMResultSet *resultSet = nil;
    NSInteger bookmarkID = 0;
    if ([self.db open])
    {
        resultSet = [self.db executeQuery:sql];
        if ([self.db hadError])
            NSLog(@"error:%@", [self.db lastError]);
    }
    
    while ([resultSet next])
        bookmarkID = [resultSet intForColumn:@"bookmarkID"];
    [self.db close];

    return bookmarkID;
}

- (BOOL)addBookmark:(EPubBookmark *)bookmark
{
    NSData *bookMarkData = [NSKeyedArchiver archivedDataWithRootObject:bookmark];
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@ (bookmark) VALUES (?)", self.tableName];
    BOOL result = NO;
    if ([self.db open])
    {
        result = [self.db executeUpdate:sql, bookMarkData];
        if ([self.db hadError])
            NSLog(@"error:%@", [self.db lastError]);
    }
    [self.db close];
    return result;
}

- (BOOL)deleteBookmark:(EPubBookmark *)bookmark
{
    NSInteger bookmarkID = bookmark.bookmarkID;
    NSString *sql  = [NSString stringWithFormat:@"DELETE FROM %@ WHERE bookmarkID = %d", self.tableName, bookmarkID];
    BOOL result = NO;
    if ([self.db open])
    {
        result = [self.db executeUpdate:sql];
        if ([self.db hadError])
            NSLog(@"error:%@", [self.db lastError]);
    }
    [self.db close];
    
    return result;
}

- (EPubBookmark *)lastBookmark
{
    NSArray *bookmarks = [self allBookmark];
    return [bookmarks lastObject];
}

- (NSArray *)allBookmark
{
    NSString *sql = [NSString stringWithFormat:@"SELECT %@ FROM %@", @"bookmark", self.tableName];
    FMResultSet *resultSet = nil;
    NSMutableArray *resultArray = [NSMutableArray array];
    if ([self.db open])
    {
        resultSet = [self.db executeQuery:sql];
        if ([self.db hadError])
            NSLog(@"error:%@", [self.db lastError]);
    }
    
    while ([resultSet next])
    {
        NSData *data = [resultSet objectForColumnName:@"bookmark"];
        EPubBookmark *bookmark = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [resultArray addObject:bookmark];
    }
    [self.db close];
    
    return resultArray;
}

@end



