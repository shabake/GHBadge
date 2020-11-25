//
//  UIView+Badge.m
//  GHBadge
//
//  Created by mac on 2020/6/23.
//  Copyright © 2020 GHBadge. All rights reserved.
//

#import "UIView+Badge.h"
#import <objc/runtime.h>

@interface UIView()

@end

@implementation UIView (Badge)

static NSString *GHBadgeKey = @"GHBadgeKey";

- (void)setBadge:(UILabel *)badge {
    objc_setAssociatedObject(self, &GHBadgeKey, badge, OBJC_ASSOCIATION_RETAIN);
}

- (UILabel *)badge {
    return objc_getAssociatedObject(self, &GHBadgeKey);
}

- (void)addPointWithTarget:(UIView *)targetView {
    if (!targetView) {
        return;
    }
    [self addBadgeWithText:@"" backgroundColor:[UIColor redColor] textColor:[UIColor clearColor] font:0 badgeFrame:CGRectMake(targetView.frame.size.width - 5 * 0.5, - 5 * 0.5, 5, 5) superObject:targetView];
}

- (void)addPointWithTabVc:(UITabBarController *)tabVc {
    for (UIView *button in tabVc.tabBar.subviews) {
        if ([button isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIView *imageView in button.subviews) {
                if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    [tabVc.view addPointWithTarget:imageView];
                }
            }
        }
    }
}

- (void)addBadgeWithText:(NSString *)text
         backgroundColor:(UIColor *)backgroundColor
               textColor:(UIColor *)textColor
                    font:(CGFloat)font
              badgeFrame:(CGRect)badgeFrame
             superObject:(UIView *)superObject{
    if (self.badge == nil) {
        self.badge = [[UILabel alloc]init];
        self.badge.tag = 991;
        self.badge.textColor = textColor;
        self.badge.text = text;
        self.badge.backgroundColor = backgroundColor;
        self.badge.textAlignment = NSTextAlignmentCenter;
        self.badge.font = [UIFont systemFontOfSize:font];
        self.badge.frame = badgeFrame;
        self.badge.layer.masksToBounds = YES;
        self.badge.layer.cornerRadius = badgeFrame.size.height  * 0.5;
        objc_setAssociatedObject(self, &GHBadgeKey, self.badge, OBJC_ASSOCIATION_RETAIN);
    }
    [superObject addSubview:self.badge];
    [superObject bringSubviewToFront:self.badge];
}

- (void)removePointWithTarget:(UIView *)targetView {
    if (!targetView) {
        return;
    }
    UIView *aView;
    for (UIView *view in targetView.subviews) {
        if (view.tag == 991) {
            aView = view;
            break;
        }
    }
    if (aView) {
        [aView removeFromSuperview];
    }
}

- (void)removePointWithTabVc:(UITabBarController *)tabVc {
    if (!tabVc) {
        return;
    }
    for (UIView *button in tabVc.tabBar.subviews) {
        if ([button isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIView *imageView in button.subviews) {
                if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    [tabVc.view removePointWithTarget:imageView];
                }
            }
        }
    }
}

- (void)removeAllPoint {
    
}
@end
