# LWFKit

LWFKit is a framework to using [LWF](https://github.com/gree/lwf) on your Objective-C project powered by [Ejecta](https://github.com/phoboslab/Ejecta).

## Setup

  1. Import `LWFKit` directory into your project.
  2. Add linked frameworks and libraries   
    `OpenGLES.framework`, `OpenAL.framework`, `CoreText.framework`,
    `CFNetwork.framework`, `QuartzCore.framework` `AudioToolbox.framework`,
    `AVFoundation.framework`, `SystemConfiguration.framework`,
    `libstdc++.dylib`, `libicucore.dylib`, `LWFKit/Externals/libJavaScriptCore.a`
  3. Add files to Copy Bundle Resources  
    `LWFKit/Externals/Ejecta/EJCanvas/2D/Shaders/*`
    `LWFKit/Externals/Ejecta/Ejecta.js`
    `LWFKit/Scripts`
  4. Add `"$(SRCROOT)/LWFKit/Externals"` into Header Search Path

## How to Use

### Initialize 

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    LKView *lwf = [[LWView alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
    [lwf load:@"example.lwf" completed:^ {
        NSLog(@"loaded");
    }];
    [self.view addSubView:lwf];
}
```

### Timeline Control

```objc
[lwf gotoAndPlayWithFrameLabel:@"jump"];
[lwf gotoAndPlayWithFrameLabel:10];
[lwf stop];
```

## License

MIT License

## References
  [LWF](http://gree.github.io/lwf/)  
  [Ejecta](http://impactjs.com/ejecta)
