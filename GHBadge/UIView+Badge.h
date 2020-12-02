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
 */
- (void)addPointWithText:(NSString *)text;

/**
 *  给目标view增加角标
 */
- (void)addPoint;

/**
 *  给目标view移除角标
 */
- (void)removePoint;

/**
 *  给TabBarItem增加角标
 */
- (void)addPointToTabVcWithIndex:(NSInteger)index;

/**
 *  给TabBarItem移除角标
 */
- (void)removePointFromTabVcWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
