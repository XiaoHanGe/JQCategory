//
//  UITextField+removeDelegate.m
//  HanJunqiang
//
//  Created by HaRi on 16/7/22.
//  Copyright © 2016年 HanJunqiang. All rights reserved. iOS开发QQ群：446310206
//

#import "UITextField+removeDelegate.h"
#import <objc/runtime.h>
NSString * const textFieldDidDeleteBackwardNotification = @"com.HanJunqiang.textfield.did.notification";

@implementation UITextField (removeDelegate)

+ (void)load {
    //交换2个方法中的IMP
    Method method1 = class_getInstanceMethod([self class], NSSelectorFromString(@"deleteBackward"));
    Method method2 = class_getInstanceMethod([self class], @selector(wj_deleteBackward));
    method_exchangeImplementations(method1, method2);
}

- (void)wj_deleteBackward {
    [self wj_deleteBackward];
    
    if ([self.delegate respondsToSelector:@selector(textFieldDidDeleteBackward:)])
    {
        id <deleteTextFieldDelegate> delegate  = (id<deleteTextFieldDelegate>)self.delegate;
        [delegate textFieldDidDeleteBackward:self];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:textFieldDidDeleteBackwardNotification object:self];
}


@end
