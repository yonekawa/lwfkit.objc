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

static NSString * const kLKCallbackOnLoad = @"onload";

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

- (void)load:(NSString *)lwf prefix:(NSString *)prefix completed:(void (^)())completed
{
    NSString *path = [self pathForResource:kLKMainScript];
    NSString *format = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSString *script = [NSString stringWithFormat:format, lwf, prefix];
    [self evaluateScript:script sourceURL:kLKMainScript];
}

- (void)gotoAndPlayWithFrameLabel:(NSString *)label
{
    
}

- (void)gotoAndPlayWithFrameNumber:(NSUInteger)number
{
    
}

- (void)stop
{
    
}

#pragma mark - Private Methods

- (void)callback:(NSString *)key
{
    
}

@end
