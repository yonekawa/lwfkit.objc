//
//  MainViewController.m
//  LWFKit
//
//  Created by Kenichi Yonekawa on 13/08/27.
//  Copyright (c) 2013 mog2dev.jp. All rights reserved.
//

#import "MainViewController.h"
#import "LKView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    LKView *lwf = [[LKView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [lwf load:@"example.lwf" completed:nil];
    [self.view addSubview:lwf];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
