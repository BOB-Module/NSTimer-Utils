//
//  NSTimer+EOCBlocksSupport.h
//  NSTimer-with-Blocks-Support
//
//  Created by HuangLibo on 2021/5/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (EOCBlocksSupport)

/// Creates a timer and schedules it on the current run loop in the default mode.
+ (NSTimer *)eoc_scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

/// 可以稍后给 timer 指定 run loop mode
+ (NSTimer *)eoc_timerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end

NS_ASSUME_NONNULL_END
