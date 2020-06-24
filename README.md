# GHBadge
**给`UIView`和`UITabBarController`的`tabBarItem`增加角标**

先看效果

![image.png](https://upload-images.jianshu.io/upload_images/1419035-5ca9f9314914bf43.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/320)

### API

**给`View`增加角标**

```
/// 给view增加角标
/// @param object 要增加的目标view
/// @param pointWidth 角标的宽度
- (void)addPointWithObject:(UIView *)object pointWidth:(CGFloat)pointWidth;

```

**当无法获取到目标`View`的时候使用以下方法**

```
/// 在场景中如何无法获得目标object的frame用此方法
/// 给view增加角标
/// @param object 要增加的目标view
/// @param pointWidth 角标的宽度
/// @param width   object的宽度
- (void)addPointWithObject:(UIView *)object pointWidth:(CGFloat)pointWidth width:(CGFloat)width;

```

**移除目标View的角标**

```
/// 给view移除角标
/// @param object 要增加的目标view
- (void)removePointWithObject:(UIView *)object;
```

**给`TabBarItem`增加角标**

```
/// 给TabBarItem增加角标
/// @param tabVc 要增加的目标tabBarController
/// @param pointWidth 角标的宽度
- (void)addPointWithTabVc:(UITabBarController *)tabVc pointWidth:(CGFloat)pointWidth;
```

**`TabBarItem`移除角标**

```
/// 给TabBarItem移除角标
/// @param tabVc 要增加的目标tabBarController
- (void)removePointWithTabVc:(UITabBarController *)tabVc;
```


