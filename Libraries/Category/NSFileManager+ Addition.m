//
//  NSFileManager+HW.m
//  StringDemo
//
//  Created by 何 振东 on 12-10-11.
//  Copyright (c) 2012年 wsk. All rights reserved.
//

#import "NSFileManager+Addition.h"

@implementation NSFileManager (Addition)

+ (BOOL)createFolder:(NSString *)folder atPath:(NSString *)path
{
    NSString *savePath = [path stringByAppendingPathComponent:folder];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL exist = [fileManager fileExistsAtPath:savePath isDirectory:&isDirectory];
    NSError *error = nil;
    if (!exist || !isDirectory)
    {
        [fileManager createDirectoryAtPath:savePath withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    return [fileManager fileExistsAtPath:savePath isDirectory:&isDirectory];
}

+ (BOOL)saveData:(NSData *)data withName:(NSString *)name atPath:(NSString *)path
{
    if (data && name && path)
    {
        NSString *filePath = [path stringByAppendingPathComponent:name];
        return [data writeToFile:filePath atomically:YES];
    }
    
    return NO;
}

+ (NSData *)findFile:(NSString *)fileName atPath:(NSString *)path
{
    NSData *data = nil;
    if (fileName && path)
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *filePath = [path stringByAppendingPathComponent:fileName];
        
        if ([fileManager fileExistsAtPath:filePath])
        {
            data = [NSData dataWithContentsOfFile:filePath];
        }
    }
    
    return data;
}

+ (BOOL)deleteFile:(NSString *)fileName atPath:(NSString *)path
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    NSError *error;
    BOOL success = [fileManager removeItemAtPath:filePath error:&error];
    return success;
}

@end
