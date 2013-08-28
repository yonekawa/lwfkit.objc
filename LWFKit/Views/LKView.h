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
- (void)gotoAndPlayWithFrameLabel:(NSString *)label;
- (void)gotoAndPlayWithFrameNumber:(NSUInteger)number;
- (void)stop;
@end
