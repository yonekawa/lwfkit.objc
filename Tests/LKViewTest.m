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

- (void)testLoad
{
    id lwfMock = [OCMockObject partialMockForObject:[[LKView alloc] init]];

    NSString *path = [lwfMock pathForResource:@"main.js"];
    NSString *format = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSString *script = [NSString stringWithFormat:format, @"test.lwf", @""];

    [[lwfMock expect] evaluateScript:script sourceURL:@"main.js"];
    [lwfMock load:@"test.lwf" completed:nil];

    [lwfMock verify];
}

- (void)testGotoAndPlayWithFrameLabel
{
    id lwfMock = [OCMockObject partialMockForObject:[[LKView alloc] init]];

    NSString *path = [lwfMock pathForResource:@"goto_and_play_with_frame_label.js"];
    NSString *format = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSString *script = [NSString stringWithFormat:format, @"rootMovie", @"jump"];
    [[lwfMock expect] evaluateScript:script sourceURL:@"goto_and_play_with_frame_label.js"];
    [lwfMock gotoAndPlayWithFrameLabel:@"jump"];
    [lwfMock verify];
}

- (void)testGotoAndPlayWithFrameNumber
{
    id lwfMock = [OCMockObject partialMockForObject:[[LKView alloc] init]];
    
    NSString *path = [lwfMock pathForResource:@"goto_and_play_with_frame_number.js"];
    NSString *format = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSString *script = [NSString stringWithFormat:format, @"rootMovie", 10];
    [[lwfMock expect] evaluateScript:script sourceURL:@"goto_and_play_with_frame_number.js"];
    [lwfMock gotoAndPlayWithFrameNumber:10];
    [lwfMock verify];
}

- (void)testStop
{
    id lwfMock = [OCMockObject partialMockForObject:[[LKView alloc] init]];

    NSString *path = [lwfMock pathForResource:@"stop.js"];
    NSString *format = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSString *script = [NSString stringWithFormat:format, @"rootMovie"];
    [[lwfMock expect] evaluateScript:script sourceURL:@"stop.js"];
    [lwfMock stop];
    [lwfMock verify];
}

- (void)testAddEventHandler
{
    NSString *event = @"event";
    id lwfMock = [OCMockObject partialMockForObject:[[LKView alloc] init]];

    NSString *path = [lwfMock pathForResource:@"add_event_handler.js"];
    NSString *format = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSString *script = [NSString stringWithFormat:format, event];
    [[lwfMock expect] evaluateScript:script sourceURL:@"add_event_handler.js"];
    [lwfMock addEventHandler:event handler:^{}];
    [lwfMock verify];

    NSDictionary *eventHandlers = [lwfMock performSelector:@selector(eventHandlers)];

    NSArray *handlers = [eventHandlers objectForKey:event];
    expect(handlers).notTo.beNil();
    expect([handlers count]).to.equal(1);
}

- (void)testRemoveEventHandler
{
    NSString *event = @"event";
    id lwfMock = [OCMockObject partialMockForObject:[[LKView alloc] init]];

    void (^handler)() = ^{};
    [lwfMock addEventHandler:event handler:handler];
    [lwfMock removeEventHandler:event handler:handler];

    NSDictionary *eventHandlers = [lwfMock performSelector:@selector(eventHandlers)];
    NSArray *handlers = [eventHandlers objectForKey:event];
    expect(handlers).notTo.beNil();
    expect([handlers count]).to.equal(0);
}

@end
