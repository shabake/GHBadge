//
//  ViewController.m
//  GHBadge
//
//  Created by mac on 2020/6/23.
//  Copyright © 2020 GHBadge. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Badge.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic , strong) UILabel *test;
@property (nonatomic , strong) NSMutableArray *tests;

@end

@implementation ViewController

- (NSMutableArray *)tests {
    if (_tests == nil) {
        _tests = [NSMutableArray array];
    }
    return _tests;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"GHBadge";
    
    UIButton *action = [[UIButton alloc]init];
    [action setTitle:@"增加Badge" forState:UIControlStateNormal];
    [action setTitle:@"移除Badge" forState:UIControlStateSelected];
    [action setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [action setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [action addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:action];
    
    UILabel *test1 = [[UILabel alloc]init];
    test1.text = @"测试一下";
    test1.textAlignment = NSTextAlignmentCenter;
    self.test = test1;
    [self.view addSubview:test1];
    [test1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(100);
    }];
}

- (void)clickAction:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        [self.view addPointWithObject:self.test pointWidth:5];
    } else {
        [self.view removePointWithObject:self.test];
    }
}

@end