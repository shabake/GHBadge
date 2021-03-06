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

@property (nonatomic , strong) UILabel *label;
@property (nonatomic , strong) UIButton *action;
@property (nonatomic , strong) UIButton *button;
@property (nonatomic , strong) UIButton *button1;
@property (nonatomic , strong) UIImageView *imageView;
@property (nonatomic , strong) UIView *view0;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"GHBadge";
    UIButton *action = [[UIButton alloc]init];
    [action setTitle:@"增加Badge" forState:UIControlStateNormal];
    [action setTitle:@"移除Badge" forState:UIControlStateSelected];
    [action setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.action = action;
    
    [action addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"aa" style:UIBarButtonItemStylePlain target:self action:@selector(clickAction)];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"label";
    label.textAlignment = NSTextAlignmentCenter;
    self.label = label;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(100);
    }];
    
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:@"button" forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    self.button = button;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label);
        make.top.equalTo(self.label.mas_bottom).offset(20);
    }];
    
    UIButton *button1 = [[UIButton alloc]init];
    [button1 setTitle:@"button1" forState:UIControlStateNormal];
    button1.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    self.button1 = button1;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button.mas_right).offset(50);
        make.top.equalTo(self.button);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.backgroundColor = [UIColor blueColor];
    self.imageView = imageView;
    [self.view addSubview:imageView];
    UILabel *label0 = [[UILabel alloc]init];
    label0.text = @"imageView";
    label0.textColor = [UIColor whiteColor];
    label0.textAlignment = NSTextAlignmentCenter;
    [self.imageView addSubview:label0];
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.imageView);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.button);
        make.top.equalTo(self.button.mas_bottom).offset(20);
        make.height.equalTo(@50);
        make.width.equalTo(@100);
    }];
    
    UIView *view0 = [[UIView alloc]init];
    view0.backgroundColor = [UIColor orangeColor];
    self.view0 = view0;
    [self.view addSubview:view0];
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"view";
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view0 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view0);
    }];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView);
        make.top.equalTo(self.imageView.mas_bottom).offset(20);
        make.height.equalTo(@50);
        make.width.equalTo(@100);
    }];
}

- (void)clickAction {
    [self.button addPoint];
    [self.button1 addPoint];
    [self.label addPointWithText:@"22"];
    [self.imageView addPointWithText:@"101"];
    [self.view0 addPoint];
    [self.view addPointToTabVcWithIndex:1];
}

@end
