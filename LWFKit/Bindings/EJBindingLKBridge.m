//
//  EJBindingLKBridge.m
//  LWFKit
//
//  Created by Kenichi Yonekawa on 13/08/28.
//  Copyright (c) 2013 mog2dev.jp. All rights reserved.
//

#import "EJBindingLKBridge.h"
#import "LKView.h"

@implementation EJBindingLKBridge

EJ_BIND_FUNCTION(loadComplete, ctx, argc, argv) {
    [((LKView *)scriptView) didLoadCompleted];
	return NULL;
}

EJ_BIND_FUNCTION(notify, ctx, argc, argv) {
    if( argc < 1 ) { return NULL; }

	[((LKView *)scriptView) notify:JSValueToNSString(ctx, argv[0])];
	return NULL;
}

@end
