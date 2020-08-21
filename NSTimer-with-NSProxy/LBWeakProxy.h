//
//  LBWeakProxy.h
//  NSTimer-with-NSProxy
//
//  Created by HuangLibo on 2020/8/20.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBWeakProxy : NSProxy

/// 弱引用原 Target
@property (nonatomic, weak) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
