//
//  LKView.m
//  LWFKit
//
//  Created by Kenichi Yonekawa on 13/08/27.
//  Copyright (c) 2013 mog2dev.jp. All rights reserved.
//

#import "LKView.h"

static NSString * const kLKScriptsFolder = @"Scripts/";
static NSString * const kLKLoadLWFScript = @"";

static NSString * const kLKCallbackOnLoad = @"onload";

@interface LKView()
@end

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
    }
    return self;
}

- (void)load:(NSString *)lwf completed:(void (^)())completed;
{
    [self evaluateScript:kLKLoadLWFScript];
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
