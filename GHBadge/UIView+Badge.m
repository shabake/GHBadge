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

#define kBadgeWidth 10
#define kBadgeHeight 10

/**
 *  存放Badge的数组
 */
static NSString *GHBadgesKey = @"GHBadgesKey";

- (void)setBadges:(NSMutableArray *)badges {
    objc_setAssociatedObject(self, &GHBadgesKey, badges, OBJC_ASSOCIATION_RETAIN);
}

- (NSMutableArray *)badges {
    if (objc_getAssociatedObject(self, &GHBadgesKey) == nil) {
        NSMutableArray *_badges = [NSMutableArray array];
        objc_setAssociatedObject(self, &GHBadgesKey, _badges, OBJC_ASSOCIATION_RETAIN);
    }
    return objc_getAssociatedObject(self, &GHBadgesKey);
}

- (void)addPointWithTarget:(UIView *)targetView {
    if (!targetView) {
        return;
    }
    [self addBadgeWithText:@"" backgroundColor:[UIColor redColor] textColor:[UIColor clearColor] font:0 badgeFrame:CGRectMake(targetView.frame.size.width - kBadgeWidth * 0.5, - kBadgeHeight * 0.5, kBadgeWidth, kBadgeHeight) superObject:targetView];
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
    UILabel *badge = [[UILabel alloc]init];
    badge.textColor = textColor;
    badge.text = text;
    badge.tag = 200;
    badge.backgroundColor = backgroundColor;
    badge.textAlignment = NSTextAlignmentCenter;
    badge.font = [UIFont systemFontOfSize:font];
    badge.frame = badgeFrame;
    badge.layer.masksToBounds = YES;
    badge.layer.cornerRadius = badgeFrame.size.height  * 0.5;
    [self.badges addObject:badge];
    [superObject addSubview:badge];
    [superObject bringSubviewToFront:badge];
}

- (void)removePointWithTarget:(UIView *)targetView {
    if (!targetView) {
        return;
    }
    UIView *aView;
    for (UIView *view in targetView.subviews) {
        if (view.tag == 200) {
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

@end
