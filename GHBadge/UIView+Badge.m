//
//  UIView+Badge.m
//  GHBadge
//
//  Created by mac on 2020/6/23.
//  Copyright © 2020 GHBadge. All rights reserved.
//

#import "UIView+Badge.h"
#import <objc/runtime.h>


typedef NS_ENUM(NSInteger, GHBadgeType) {
    GHBadgeTypeView = 0,
    GHBadgeTypeButton,
    GHBadgeTypeLabel,
    GHBadgeTypImageView,
    GHBadgeTypeTabBarItem,
    GHBadgeTypeBarButtonItem,
    GHBadgeTypeUnknown,
    
};

@interface UIView()

@end

@implementation UIView (Badge)

#define kBadgeWidth 10
#define kBadgeHeight 10

/**
 *  存放Badge的数组
 */
static NSString *GHBadgesDictKey = @"GHBadgesDictKey";

- (void)setBadgesDict:(NSMutableArray *)badgesDict {
    objc_setAssociatedObject(self, &GHBadgesDictKey, badgesDict, OBJC_ASSOCIATION_RETAIN);
}

- (NSMutableArray *)badgesDict {
    if (objc_getAssociatedObject(self, &GHBadgesDictKey) == nil) {
        NSMutableArray *_badgesDict = [NSMutableArray array];
        objc_setAssociatedObject(self, &GHBadgesDictKey, _badgesDict, OBJC_ASSOCIATION_RETAIN);
    }
    return objc_getAssociatedObject(self, &GHBadgesDictKey);
}

/**
 *  存放Badge的数组
 */
static NSString *GHBadgesTypeKey = @"GHBadgesTypeKey";

- (void)setBadgeType:(GHBadgeType)badgeType {
    objc_setAssociatedObject(self, &GHBadgesTypeKey, @(badgeType), OBJC_ASSOCIATION_RETAIN);
}

- (GHBadgeType)badgeType {
    NSNumber *badgeTypeNumber = objc_getAssociatedObject(self, &GHBadgesTypeKey);
    return (GHBadgeType)badgeTypeNumber.integerValue;
}

- (void)addPoint {
    if (!self) {
        return;
    }
    [self addBadgeWithText:@"" backgroundColor:[UIColor redColor] textColor:[UIColor clearColor] font:0 badgeFrame:CGRectMake(self.frame.size.width - kBadgeWidth * 0.5, - kBadgeHeight * 0.5, kBadgeWidth, kBadgeHeight) superObject:self];
}

- (void)addPointWithText:(NSString *)text {
    if (!self) {
        return;
    }
    CGSize size = [self sizeWithText:text andFont:[UIFont boldSystemFontOfSize:10]];
    [self addBadgeWithText:text backgroundColor:[UIColor redColor] textColor:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:10] badgeFrame:CGRectMake(self.frame.size.width, - size.height * 0.5, 20, 20) superObject:self];
}

- (void)addPointToTabVcWithIndex:(NSInteger)index {
    UITabBarController *tabBarVc = [self tabBarControllerFromView:self];
    NSMutableArray *tabBarButtons = [NSMutableArray array];
    for (UIView *view in tabBarVc.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtons addObject:view];
        }
    }
    UIView *view = tabBarButtons[index];
    for (UIView *imageView in view.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            [imageView addPoint];
        }
    }
}

- (void)addBadgeWithText:(NSString *)text backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor font:(UIFont *)font badgeFrame:(CGRect)badgeFrame  superObject:(UIView *)superObject {
    GHBadgeType type = GHBadgeTypeView;
    if ([superObject isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
        type = GHBadgeTypeTabBarItem;
    } else if ([superObject isKindOfClass:NSClassFromString(@"UIImageView")]) {
        type = GHBadgeTypImageView;
    } else if ([superObject isKindOfClass:NSClassFromString(@"UIButton")]) {
        type = GHBadgeTypeButton;
    } else if ([superObject isKindOfClass:NSClassFromString(@"UIView")]) {
        type = GHBadgeTypeView;
    } else if ([superObject isKindOfClass:NSClassFromString(@"UILabel")]) {
        type = GHBadgeTypeLabel;
    } else {
        type = GHBadgeTypeUnknown;
    }
    UILabel *badge = [[UILabel alloc]init];
    badge.textColor = textColor;
    badge.text = text;
    badge.tag = 200;
    badge.backgroundColor = backgroundColor;
    badge.textAlignment = NSTextAlignmentCenter;
    badge.font = font;
    badge.frame = badgeFrame;
    badge.layer.masksToBounds = YES;
    badge.layer.cornerRadius = badgeFrame.size.height  * 0.5;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"badge"] = badge;
    dict[@"type"] = @(type);
    [self.badgesDict addObject:dict];
    [superObject addSubview:badge];
    [superObject bringSubviewToFront:badge];
}

- (void)removePoint{
    if (!self) {
        return;
    }
    UIView *aView;
    for (UIView *view in self.subviews) {
        if (view.tag == 200) {
            aView = view;
            break;
        }
    }
    if (aView) {
        [aView removeFromSuperview];
    }
}

- (void)removePointFromTabVcWithIndex:(NSInteger)index {
    UITabBarController *tabBarVc = [self tabBarControllerFromView:self];
    if (!self) {
        return;
    }
    
    NSMutableArray *tabBarButtons = [NSMutableArray array];
    for (UIView *view in tabBarVc.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtons addObject:view];
        }
    }
    UIView *view = tabBarButtons[index];
    for (UIView *imageView in view.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            [imageView removePoint];
        }
    }
}

- (UIViewController *)viewControllerFromView:(UIView *)view {
    for (UIView *next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UINavigationController *)navigationControllerFromView:(UIView *)view {
    for (UIView *next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)nextResponder;
        }
    }
    return nil;
}

- (UITabBarController *)tabBarControllerFromView:(UIView *)view {
    for (UIView *next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UITabBarController class]]) {
            return (UITabBarController *)nextResponder;
        }
    }
    return nil;
}


- (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font{
    return [self sizeWithText:text andFont:font andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
}

- (CGSize)sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize {
    CGSize expectedLabelSize = CGSizeZero;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    [paragraphStyle setLineSpacing:0];
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    expectedLabelSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
}

@end
