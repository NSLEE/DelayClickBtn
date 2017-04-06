//
//  UIControl+KOBtnClickDelay.m
//  DelayClickBtn
//
//  Created by KOLee on 2017/4/6.
//  Copyright © 2017年 KOLee. All rights reserved.
//

#import "UIControl+KOBtnClickDelay.h"

#import <objc/runtime.h>

@interface UIControl ()


/**
 是否忽略点击
 */
@property (nonatomic,assign) BOOL KO_ignoreEvent;


@end

@implementation UIControl (KOBtnClickDelay)


- (void)KO_sendAction:(SEL)action to:(id)target ForEvent:(UIEvent *)event{
    if (self.KO_ignoreEvent) {
        return ;
    }
    
    if (self.KO_Interval > 0) {
        self.KO_ignoreEvent = YES ;
        [self performSelector:@selector(setKO_ignoreEvent:)
                   withObject:@(NO)
                   afterDelay:self.KO_Interval];
        
    }
    [self KO_sendAction:action to:target ForEvent:event];
    
}

#pragma mark - get and set method

- (void)setKO_ignoreEvent:(BOOL)KO_ignoreEvent{
    objc_setAssociatedObject(self, @selector(KO_ignoreEvent), @(KO_ignoreEvent), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)KO_ignoreEvent{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}


- (void)setKO_Interval:(NSTimeInterval)KO_Interval{
    objc_setAssociatedObject(self, @selector(KO_Interval), @(KO_Interval), OBJC_ASSOCIATION_ASSIGN);
}

- (NSTimeInterval)KO_Interval{
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

//交换方法
+(void)load{
    Method add_Method = class_getInstanceMethod(self, @selector(KO_sendAction:to:ForEvent:));
    Method sys_Method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    
    method_exchangeImplementations(sys_Method, add_Method);
}



@end
