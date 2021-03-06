//
//  GHTabBarController.m
//  GHBadge
//
//  Created by mac on 2020/6/24.
//  Copyright © 2020 GHBadge. All rights reserved.
//

#import "GHTabBarController.h"
#import "ViewController.h"

@interface GHTabBarController ()

@end

@implementation GHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"111";
    [self setupVc];
}

- (void)setupVc  {
    ViewController *vc = [[ViewController alloc]init];
    [self addChildViewControllerWithVC:vc title:@"首页" image:@"tabBar_home_normal" selectedImage:@"tabBar_home_selected"];
    
    ViewController *vc1 = [[ViewController alloc]init];
    [self addChildViewControllerWithVC:vc1 title:@"首页" image:@"tabBar_home_normal" selectedImage:@"tabBar_home_selected"];
}

- (void)addChildViewControllerWithVC: (UIViewController *)vc
                               title: (NSString *)title
                               image: (NSString *)imageName
                       selectedImage: (NSString *)selectedImageName {
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
    [vc.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
