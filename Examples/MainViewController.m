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
@property(nonatomic, strong) LKView *lwf;
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.lwf = [[LKView alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
    self.lwf.center = self.view.center;
    self.lwf.frame = CGRectMake(self.lwf.frame.origin.x, self.lwf.frame.origin.y - 100, self.lwf.frame.size.width, self.lwf.frame.size.height);
    [self.lwf load:@"example.lwf" completed:nil];
    [self.view addSubview:self.lwf];

    UIButton *jumpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    jumpButton.frame = CGRectMake(0, 0, 100, 48);
    jumpButton.center = self.view.center;
    [jumpButton setTitle:@"Jump!" forState:UIControlStateNormal];
    [jumpButton addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jumpButton];
}

- (void)jump:(id)sender
{
    [self.lwf gotoAndPlayWithFrameLabel:@"jump"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
