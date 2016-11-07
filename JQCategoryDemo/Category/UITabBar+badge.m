//
//  UITabBar+badge.m
//  baymax_marketing_iOS
//
//  Created by HaRi on 16/1/21.
//  Copyright © 2016年 HanJunqiang. All rights reserved. iOS开发QQ群：446310206
//

#import "UITabBar+badge.h"

@implementation UITabBar (badge)

- (void)showBadgeOnItemIndex:(NSInteger)index
{
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.userInteractionEnabled = NO;
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
    
    for (int i = 0; i< self.subviews.count; i++) {
        
        UIView *subView = self.subviews[i];
        
        if (index == i-1) {
            
            CGFloat y = ceilf(0.1 * tabFrame.size.height);
            CGFloat x = ceilf(CGRectGetMinX(subView.frame) + CGRectGetWidth(subView.frame)/2.0 + 14);

            badgeView.frame = CGRectMake(x, y, 10, 10);//圆形大小为10
            [self addSubview:badgeView];
            break;
        }
    }
}

- (void)hideBadgeOnItemIndex:(NSInteger)index
{
    [self removeBadgeOnItemIndex:index];
}

- (void)removeBadgeOnItemIndex:(NSInteger)index
{
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

@end
