//
//  LKView.m
//  LWFKit
//
//  Created by Kenichi Yonekawa on 13/08/27.
//  Copyright (c) 2013 mog2dev.jp. All rights reserved.
//

#import "LKView.h"

static NSString * const kLKScriptsFolder = @"Scripts/";

static NSString * const kLKLWFScript = @"lwf.js";
static NSString * const kLKMainScript = @"main.js";
static NSString * const kLKGotoAndPlayWithFrameNumberScript = @"goto_and_play_with_frame_number.js";
static NSString * const kLKGotoAndPlayWithFrameLabelScript = @"goto_and_play_with_frame_label.js";
static NSString * const kLKStopScript = @"stop.js";

@implementation LKView

- (id)init
{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame appFolder:kLKScriptsFolder];
}

- (id)initWithFrame:(CGRect)frame appFolder:(NSString *)folder
{
    self = [super initWithFrame:frame appFolder:folder];
    if (self) {
        [self loadScriptAtPath:kLKLWFScript];
    }
    return self;
}

- (void)load:(NSString *)lwf completed:(void (^)())completed
{
    [self load:lwf prefix:nil completed:completed];
}

- (void)load:(NSString *)lwf prefix:(NSString *)prefix completed:(void (^)())completed
{
    NSString *format = [self scriptFormatWithResourceName:kLKMainScript];
    NSString *script = [NSString stringWithFormat:format, lwf, prefix ? prefix : @""];
    [self evaluateScript:script sourceURL:kLKMainScript];
}

- (void)gotoAndPlayWithFrameLabel:(NSString *)label
{
    [self gotoAndPlayWithFrameLabel:label instanceName:@"rootMovie"];
}

- (void)gotoAndPlayWithFrameLabel:(NSString *)label instanceName:(NSString *)instanceName
{
    NSString *format = [self scriptFormatWithResourceName:kLKGotoAndPlayWithFrameLabelScript];
    NSString *script = [NSString stringWithFormat:format, instanceName, label];
    [self evaluateScript:script sourceURL:kLKGotoAndPlayWithFrameLabelScript];
}

- (void)gotoAndPlayWithFrameNumber:(NSUInteger)number
{
    [self gotoAndPlayWithFrameNumber:number instanceName:@"rootMovie"];
}

- (void)gotoAndPlayWithFrameNumber:(NSUInteger)number instanceName:(NSString *)instanceName
{
    NSString *format = [self scriptFormatWithResourceName:kLKGotoAndPlayWithFrameNumberScript];
    NSString *script = [NSString stringWithFormat:format, instanceName, number];
    [self evaluateScript:script sourceURL:kLKGotoAndPlayWithFrameNumberScript];
}

- (void)stop
{
    [self stopWithInstanceName:@"rootMovie"];
}

- (void)stopWithInstanceName:(NSString *)instanceName
{
    NSString *script = [NSString stringWithFormat:[self scriptFormatWithResourceName:kLKStopScript], instanceName];
    [self evaluateScript:script sourceURL:kLKStopScript];
}

#pragma mark - Private Methods

- (NSString *)scriptFormatWithResourceName:(NSString *)name
{
    NSString *path = [self pathForResource:name];
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
}

@end
