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


/// 给view增加角标
/// @param object 要增加的目标view
/// @param pointWidth 角标的宽度
- (void)addPointWithObject:(UIView *)object pointWidth:(CGFloat)pointWidth;

/// 在场景中如何无法获得目标object的frame用此方法
/// 给view增加角标
/// @param object 要增加的目标view
/// @param pointWidth 角标的宽度
/// @param width   object的宽度
- (void)addPointWithObject:(UIView *)object pointWidth:(CGFloat)pointWidth width:(CGFloat)width;

/// 给view移除角标
/// @param object 要增加的目标view
- (void)removePointWithObject:(UIView *)object;

/// 给TabBarItem增加角标
/// @param tabVc 要增加的目标tabBarController
/// @param pointWidth 角标的宽度
- (void)addPointWithTabVc:(UITabBarController *)tabVc pointWidth:(CGFloat)pointWidth;

/// 给TabBarItem移除角标
/// @param tabVc 要增加的目标tabBarController
- (void)removePointWithTabVc:(UITabBarController *)tabVc;

@end

NS_ASSUME_NONNULL_END
