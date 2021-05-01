//
//  ViewController.m
//  NSTimer-with-Blocks-Support
//
//  Created by HuangLibo on 2021/5/1.
//

#import "ViewController.h"
#import "NSTimer+EOCBlocksSupport.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer eoc_scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"%@, %@", strongSelf, timer);
    }];
}

- (void)dealloc {
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"%s", __func__);
}

@end
