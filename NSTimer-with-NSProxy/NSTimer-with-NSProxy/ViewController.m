//
//  ViewController.m
//  NSTimer-with-NSProxy
//
//  Created by HuangLibo on 2020/8/20.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import "ViewController.h"
#import "LBWeakProxy.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 强引用链: self -> timer -> proxy , 而 proxy 弱引用 self, 不会形成循环引用
    LBWeakProxy *proxy = [LBWeakProxy proxyWithTarget:self];
    
    /// 方式一: 使用默认的 run loop mode (这种情况下, `timer` 属性可直接用 weak 修饰, 因为 run loop 会强引用 `timer`)
    /*
     self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxy selector:@selector(timerTriggered:) userInfo:nil repeats:YES];
     */
    
    /// 方式二: 自行指定 run loop mode
    self.timer = [NSTimer timerWithTimeInterval:1 target:proxy selector:@selector(timerTriggered:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)timerTriggered:(NSTimer *)timer {
    NSLog(@"timerTriggered");
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"%s", __func__);
}

@end
