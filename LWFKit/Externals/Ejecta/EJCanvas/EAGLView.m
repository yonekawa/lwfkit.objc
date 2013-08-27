#import <QuartzCore/QuartzCore.h>
#import "EAGLView.h"

@implementation EAGLView

+ (Class)layerClass {
	return [CAEAGLLayer class];
}

- (id)initWithFrame:(CGRect)frame contentScale:(float)contentScale retainedBacking:(BOOL)retainedBacking {
	if( self = [super initWithFrame:frame] ) {
		[self setMultipleTouchEnabled:YES];
		[self setBackgroundColor:[UIColor clearColor]];
		[self setOpaque:NO];
		
		CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
		
		self.contentScaleFactor = contentScale;
		eaglLayer.contentsScale = contentScale;

		eaglLayer.opaque = FALSE;
		
		eaglLayer.drawableProperties = @{
			kEAGLDrawablePropertyRetainedBacking: @(retainedBacking),
			kEAGLDrawablePropertyColorFormat: kEAGLColorFormatRGBA8
		};
	}
	return self;
}

@end
