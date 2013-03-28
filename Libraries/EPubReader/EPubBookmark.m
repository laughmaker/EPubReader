//
//  Created by line0 on 13-3-4.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

#import "EPubBookmark.h"

#define kMarkName           @"kmarkName"
#define kAddTime            @"addTime"
#define kPageIndexInSpine   @"pageIndexInSpine"
#define kSpineIndex         @"spineIndex"
#define kBookmarkID         @"bookmarkID"
#define kDescription        @"description"

@implementation EPubBookmark

- (id)initWithBookmarkID:(NSInteger)bookmarkID
{
    self = [self init];
    _bookmarkID = bookmarkID;
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.markName forKey:kMarkName];
    [encoder encodeObject:self.description forKey:kDescription];
    [encoder encodeObject:self.addTime forKey:kAddTime];
    [encoder encodeInteger:self.pageIndexInSpine forKey:kPageIndexInSpine];
    [encoder encodeInteger:self.spineIndex forKey:kSpineIndex];
    [encoder encodeInteger:self.bookmarkID forKey:kBookmarkID];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self)
    {
        self.markName = [decoder decodeObjectForKey:kMarkName];
        self.addTime = [decoder decodeObjectForKey:kAddTime];
        self.pageIndexInSpine = [decoder decodeIntegerForKey:kPageIndexInSpine];
        self.spineIndex = [decoder decodeIntegerForKey:kSpineIndex];
        _bookmarkID = [decoder decodeIntegerForKey:kBookmarkID];
        self.description = [decoder decodeObjectForKey:kDescription];
    }
    
    return self;
}


@end
