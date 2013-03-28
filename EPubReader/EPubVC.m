//
//  EPubVC.m
//  FuYin
//
//  Created by line0 on 13-3-4.
//  Copyright (c) 2013年 wsk. All rights reserved.
//

#import "EPubVC.h"
#import "EPubController.h"

@interface EPubVC ()
@property (strong, nonatomic) EPubController *epubController;

@end

@implementation EPubVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc] initWithTitle:@"书签" style:UIBarButtonItemStylePlain target:self action:@selector(addBookmark)];
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc] initWithTitle:@"目录" style:UIBarButtonItemStyleBordered target:self action:@selector(showChapterList)];
    self.navigationItem.rightBarButtonItems = @[rightItem1, rightItem2];
    
    NSString *bookPath = [[NSBundle mainBundle] pathForResource:@"沧海" ofType:@"epub"];
    self.epubController = [[EPubController alloc] init];
    [self.epubController openBook:bookPath atView:self.view withPageFrame:self.view.bounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)addBookmark
{
    [self.epubController addBookmark];
}

- (void)showChapterList
{
    static BOOL open = NO;
    if (!open)
    {
        [self.epubController showChapterListAtView:self.view withFrame:self.view.bounds];
        open = YES;
    }
    else
    {
        [self.epubController hideChapterListView];
        open = NO;
    }
}

@end
