//
//  EPub.m
//
//  Created by line0 on 13-3-4.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

#import "EPubBook.h"
#import "ZipArchive.h"
#import "EPubChapter.h"
#import "EPubConfig.h"

@interface EPubBook ()
@property (readonly, nonatomic) NSString *opfPath;
@property (readonly, nonatomic) NSString *ncxPath;

@end

@implementation EPubBook

- (id)initWithEPubBookPath:(NSString *)bookPath
{
	if((self = [super init]))
    {
		_bookPath   = bookPath;
        int loc1 = [bookPath rangeOfString:@"/" options:NSBackwardsSearch].location + 1;
        int loc2 = [bookPath rangeOfString:@"." options:NSBackwardsSearch].location;
        int len = loc2 - loc1;
        _bookName = [bookPath substringWithRange:NSMakeRange(loc1, len)];
		_spineArray = [[NSMutableArray alloc] init];
	}
    
    [self unzipBook];
    [self parseManifestFile];
	[self parseOPFFile];
    
	return self;
}

- (BOOL)unzipBook
{
	ZipArchive *zipArchive = [[ZipArchive alloc] init];
	if( [zipArchive UnzipOpenFile:self.bookPath])
    {
		NSString *strPath=[NSString stringWithFormat:@"%@/%@",kDocuments, self.bookName];
		NSFileManager *filemanager=[[NSFileManager alloc] init];
		if (![filemanager fileExistsAtPath:strPath])
        {
            BOOL ret = [zipArchive UnzipFileTo:[NSString stringWithFormat:@"%@/",strPath] overWrite:YES];
            if( NO ==ret )
            {
                NSLog(@"解压失败");
            }
            [zipArchive UnzipCloseFile];
            
            return ret;
		}
        else
        {
            return YES;
        }
	}
    
    return NO;
}

- (void)parseManifestFile
{
	NSString *manifestFilePath = [NSString stringWithFormat:@"%@/%@/META-INF/container.xml", kDocuments, self.bookName];
	NSFileManager *fileManager = [[NSFileManager alloc] init];
	if ([fileManager fileExistsAtPath:manifestFilePath])
    {
        NSURL *filePathUrl = [NSURL fileURLWithPath:manifestFilePath];
		CXMLDocument *manifestFile = [[CXMLDocument alloc] initWithContentsOfURL:filePathUrl options:0 error:nil];
		CXMLNode *opfPath = [manifestFile nodeForXPath:@"//@full-path[1]" error:nil];        
        _opfPath = [NSString stringWithFormat:@"%@/%@/%@", kDocuments, self.bookName, [opfPath stringValue]] ;
	}
    else
    {
		_opfPath = nil;
	}
}

- (void)parseOPFFile
{
    NSURL *opfPathUrl = [NSURL fileURLWithPath:self.opfPath];
	CXMLDocument *opfFile = [[CXMLDocument alloc] initWithContentsOfURL:opfPathUrl options:0 error:nil];
    NSDictionary *opfNamespaceMapings = [NSDictionary dictionaryWithObject:@"http://www.idpf.org/2007/opf" forKey:@"opf"];
	NSArray *itemsArray = [opfFile nodesForXPath:@"//opf:item" namespaceMappings:opfNamespaceMapings error:nil];
    
    NSString *ncxFileName;
    NSMutableDictionary *itemDictionary = [[NSMutableDictionary alloc] init];
	for (CXMLElement *element in itemsArray)
    {
		[itemDictionary setValue:[[element attributeForName:@"href"] stringValue] forKey:[[element attributeForName:@"id"] stringValue]];
        NSString *mediaType = [[element attributeForName:@"media-type"] stringValue];
        if([mediaType isEqualToString:@"application/x-dtbncx+xml"])
        {
            ncxFileName = [[element attributeForName:@"href"] stringValue];
        }
        
        if([mediaType isEqualToString:@"application/xhtml+xml"])
        {
            ncxFileName = [[element attributeForName:@"href"] stringValue];
        }
	}
	
    int lastSlash = [self.opfPath rangeOfString:@"/" options:NSBackwardsSearch].location;
	_bookBasePath = [self.opfPath substringToIndex:(lastSlash + 1)];
    _ncxPath = [NSString stringWithFormat:@"%@%@", _bookBasePath, ncxFileName];
    NSURL *ncxPathUrl = [NSURL fileURLWithPath:self.ncxPath];
    CXMLDocument *ncxToc = [[CXMLDocument alloc] initWithContentsOfURL:ncxPathUrl options:0 error:nil];
    NSMutableDictionary *titleDictionary = [[NSMutableDictionary alloc] init];
    for (CXMLElement *element in itemsArray)
    {
        NSString *href = [[element attributeForName:@"href"] stringValue];
        NSString *xpath = [NSString stringWithFormat:@"//ncx:content[@src='%@']/../ncx:navLabel/ncx:text", href];
        NSDictionary *ncxNamespaceMappings = [NSDictionary dictionaryWithObject:@"http://www.daisy.org/z3986/2005/ncx/" forKey:@"ncx"];
        NSArray *navPoints = [ncxToc nodesForXPath:xpath namespaceMappings:ncxNamespaceMappings error:nil];
        if([navPoints count] != 0)
        {
            CXMLElement *titleElement = [navPoints objectAtIndex:0];
           [titleDictionary setValue:[titleElement stringValue] forKey:href];
        }
    }
	
	NSArray *itemRefsArray = [opfFile nodesForXPath:@"//opf:itemref" namespaceMappings:opfNamespaceMapings error:nil];
	NSMutableArray *tmpArray = [[NSMutableArray alloc] init];
    int count = 0;
	for (CXMLElement *element in itemRefsArray)
    {
        NSString *chapHref   = [itemDictionary valueForKey:[[element attributeForName:@"idref"] stringValue]];
        NSString *spinePath  = [NSString stringWithFormat:@"%@%@", self.bookBasePath, chapHref];
        NSString *spineTitle = [titleDictionary valueForKey:chapHref];
        EPubChapter *chapter = [[EPubChapter alloc] init];
        [chapter setSpineIndex:count];
        [chapter setSpinePath:spinePath];
        [chapter setTitle:spineTitle];
        count++;
		[tmpArray addObject:chapter];
	}
	
	_spineArray = [NSArray arrayWithArray:tmpArray];
    _parseSucceed = self.spineArray.count > 0;
}



@end
