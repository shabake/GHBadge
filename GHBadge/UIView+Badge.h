//
//  UIView+Badge.h
//  GHBadge
//
//  Created by mac on 2020/6/23.
//  Copyright © 2020 GHBadge. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  给UIView增加角标分类
 */
@interface UIView (Badge)

/**
 *  给目标view增加角标
 *  @param targetView 要添加角标的view
 */
- (void)addPointWithTarget:(UIView *)targetView;

/**
 *  给目标view移除角标
 *  @param targetView  要移除角标的view
 */
- (void)removePointWithTarget:(UIView *)targetView;

/**
 *  给TabBarItem增加角标
 *  @param tabVc 要添加角标的UITabBarController
 */
- (void)addPointWithTabVc:(UITabBarController *)tabVc;

/**
 *  给TabBarItem移除角标
 *  @param tabVc 要移除角标的UITabBarController
 */
- (void)removePointWithTabVc:(UITabBarController *)tabVc;

@end

NS_ASSUME_NONNULL_END
