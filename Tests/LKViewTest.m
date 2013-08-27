//
//  LKViewTest.m
//  LWFKit
//
//  Created by Kenichi Yonekawa on 13/08/27.
//  Copyright (c) 2013 mog2dev.jp. All rights reserved.
//

#import "LKViewTest.h"
#import "LKView.h"

@implementation LKViewTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testCreateInstance
{
    LKView *view = [[LKView alloc] init];
    expect(view).notTo.beNil();
    expect(view.appFolder).to.equal(@"Scripts/");
}

@end
