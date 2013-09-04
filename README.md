# LWFKit

LWFKit is a framework to using [LWF](https://github.com/gree/lwf) on your Objective-C project powered by [Ejecta](https://github.com/phoboslab/Ejecta).

## Setup

### CocoaPods

  1. Add `LWFkit` into your `Podfile`
  2. `pod install`

### Manually

  1. Import `LWFKit` directory into your project.
  2. Add linked frameworks and libraries   
    `OpenGLES.framework`, `CoreText.framework`, `CFNetwork.framework`,
    `QuartzCore.framework` `SystemConfiguration.framework`,
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

    LKView *lwf = [[LKView alloc] initWithFrame:CGRectMake(0, 0, 100, 80)];
    [lwf load:@"example.lwf" completed:^ {
        NSLog(@"loaded");
    }];
    [self.view addSubView:lwf];
}
```

### Timeline Control

```objc
// Go to jump frame
[lwf gotoAndPlayWithFrameLabel:@"jump"];

// Go to frame of 10
[lwf gotoAndPlayWithFrameLabel:10];

// Stop timeline
[lwf stop];
```

###  Event Handling

You can receive notify from flash event by `fscommand`.

```objc
// Notify from fscommand('event', 'foo');
[lwf addEventHandler:@"foo", handler:^{
    NSLog(@"foo fired").
}];
```

## License

MIT License

## References
  [LWF](http://gree.github.io/lwf/)  
  [Ejecta](http://impactjs.com/ejecta)
