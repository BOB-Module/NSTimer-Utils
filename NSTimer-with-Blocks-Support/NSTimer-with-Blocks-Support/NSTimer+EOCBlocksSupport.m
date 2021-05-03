//
//  NSTimer+EOCBlocksSupport.m
//  NSTimer-with-Blocks-Support
//
//  Created by HuangLibo on 2021/5/1.
//

#import "NSTimer+EOCBlocksSupport.h"

@implementation NSTimer (EOCBlocksSupport)

+ (NSTimer *)eoc_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void (^)(NSTimer * _Nonnull))block {
    return [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(eoc_blockInvoke:) userInfo:[block copy] repeats:YES];
}

+ (NSTimer *)eoc_timerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block {
    return [self timerWithTimeInterval:timeInterval target:self selector:@selector(eoc_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)eoc_blockInvoke:(NSTimer *)timer {
    void (^block)(NSTimer *timer) = timer.userInfo;
    if (block) {
        block(timer);
    }
}

@end
