//
//  LKView.h
//  LWFKit
//
//  Created by Kenichi Yonekawa on 13/08/27.
//  Copyright (c) 2013 mog2dev.jp. All rights reserved.
//

#import "EJJavaScriptView.h"

@interface LKView : EJJavaScriptView
- (void)load:(NSString *)lwf completed:(void (^)())completed;
- (void)load:(NSString *)lwf prefix:(NSString *)prefix completed:(void (^)())completed;
- (void)didLoadCompleted;

- (void)gotoAndPlayWithFrameLabel:(NSString *)label;
- (void)gotoAndPlayWithFrameLabel:(NSString *)label instanceName:(NSString *)instanceName;
- (void)gotoAndPlayWithFrameNumber:(NSUInteger)number;
- (void)gotoAndPlayWithFrameNumber:(NSUInteger)number instanceName:(NSString *)instanceName;
- (void)stop;
- (void)stopWithInstanceName:(NSString *)instanceName;

- (void)notify:(NSString *)event;
- (void)addEventHandler:(NSString *)event handler:(void (^)())handler;
- (void)removeEventHandler:(NSString *)event handler:(void (^)())handler;
@end
