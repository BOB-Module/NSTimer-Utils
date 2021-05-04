//
//  LBWeakProxy.m
//  NSTimer-with-NSProxy
//
//  Created by HuangLibo on 2020/8/20.
//  Copyright © 2020 HuangLibo. All rights reserved.
//

#import "LBWeakProxy.h"

@implementation LBWeakProxy

+ (instancetype)proxyWithTarget:(id)target {
    LBWeakProxy *proxy = [LBWeakProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if ([self.target respondsToSelector:sel]) {
        NSMethodSignature *signature = [self.target methodSignatureForSelector:sel];
        return signature;
    } else {
        return [super methodSignatureForSelector:sel];
    }
}

-(void)forwardInvocation:(NSInvocation *)invocation {
    SEL aSelector = invocation.selector;
    if ([self.target respondsToSelector:aSelector]) {
        invocation.target = self.target;
        [invocation invoke];
    } else {
        [super forwardInvocation:invocation];
    }
}

@end
