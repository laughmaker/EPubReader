//
//  NSData+Addition.m
//  Line0
//
//  Created by line0 on 12-12-5.
//  Copyright (c) 2012年 line0. All rights reserved.
//

#import "NSData+Addition.h"

@implementation NSData (Addition)

- (NSData *)dataWithObject:(id)object
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
    return data;
}

- (id)convertDataToObject
{
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:self];
    return array;
}

@end
