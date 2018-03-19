//
//  TestViewController.m
//  Pop-upMenu
//
//  Created by EastSun on 2017/12/21.
//  Copyright © 2017年 EastSun. All rights reserved.
//

#import "TestViewController.h"
#import "ArrowheadMenu.h"// 箭头菜单
#import "CenterMenu.h"// 中心菜单

@interface TestViewController ()<MenuViewControllerDelegate>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    // 孙视图触发
    UIView *childView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width)];
    childView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:childView];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake((childView.frame.size.width-150)/2, 10, 150, 50);
    btn1.backgroundColor = [UIColor orangeColor];
    [btn1 setTitle:@"孙视图向下触发" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(bottomClick:) forControlEvents:UIControlEventTouchUpInside];
    [childView addSubview:btn1];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake((childView.frame.size.width-150)/2, (childView.frame.size.height-50-10), 150, 50);
    btn2.backgroundColor = [UIColor orangeColor];
    [btn2 setTitle:@"孙视图向上触发" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(topClick:) forControlEvents:UIControlEventTouchUpInside];
    [childView addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(childView.frame.size.width/2-5-30, (childView.frame.size.height-150)/2, 30, 150);
    btn3.backgroundColor = [UIColor orangeColor];
    [btn3 setTitle:@"left" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    [childView addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(childView.frame.size.width/2+5, (childView.frame.size.height-150)/2, 30, 150);
    btn4.backgroundColor = [UIColor orangeColor];
    [btn4 setTitle:@"right" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    [childView addSubview:btn4];
    
    
    // 左右导航栏按钮触发
    UIBarButtonItem *right1 = [[UIBarButtonItem alloc] initWithTitle:@"右触发1" style:UIBarButtonItemStylePlain target:self action:@selector(clickto:)];
    UIBarButtonItem *right2 = [[UIBarButtonItem alloc] initWithTitle:@"右触发2" style:UIBarButtonItemStylePlain target:self action:@selector(clickto:)];
    self.navigationItem.rightBarButtonItems = @[right1, right2];
    
    UIBarButtonItem *left1 = [[UIBarButtonItem alloc] initWithTitle:@"左触发1" style:UIBarButtonItemStylePlain target:self action:@selector(clickto:)];
    UIBarButtonItem *left2 = [[UIBarButtonItem alloc] initWithTitle:@"左触发2" style:UIBarButtonItemStylePlain target:self action:@selector(clickto:)];
    self.navigationItem.leftBarButtonItems = @[left1, left2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

#pragma mark - 菜单代理方法
- (void)menu:(BaseMenuViewController *)menu didClickedItemUnitWithTag:(NSInteger)tag andItemUnitTitle:(NSString *)title {
    
    NSLog(@"\n\n\n\n点击了第%lu项名字为%@的菜单项", tag, title);
    
}


- (void)bottomClick:(UIButton *)sender {
    
    ArrowheadMenu *VC = [[ArrowheadMenu alloc] initDefaultArrowheadMenuWithTitle:@[@"发起群聊", @"添加朋友", @"扫一扫"] icon:nil menuPlacements:ShowAtBottom];
    
    VC.delegate = self;
    [VC presentMenuView:sender];
}

- (void)topClick:(UIButton *)sender {
    
    ArrowheadMenu *VC = [[ArrowheadMenu alloc] initDefaultArrowheadMenuWithTitle:@[@"发起群聊", @"添加朋友", @"扫一扫"] icon:@[@"ListInspection", @"ListInspection", @"ListInspection"] menuPlacements:ShowAtTop];
    
    VC.delegate = self;
    [VC presentMenuView:sender];
}

- (void)leftClick:(UIButton *)sender {
    
    ArrowheadMenu *VC = [[ArrowheadMenu alloc] initDefaultArrowheadMenuWithTitle:@[@"发起群聊", @"添加朋友", @"扫一扫"] icon:@[@"ListInspection", @"ListInspection", @"ListInspection"] menuPlacements:ShowAtLeft];
    
    VC.delegate = self;
    [VC presentMenuView:sender];

}

- (void)rightClick:(UIButton *)sender {
    
    ArrowheadMenu *VC = [[ArrowheadMenu alloc] initDefaultArrowheadMenuWithTitle:@[@"发起群聊", @"添加朋友", @"扫一扫"] icon:@[@"ListInspection", @"ListInspection", @"ListInspection"] menuPlacements:ShowAtRight];
    
    VC.delegate = self;
    [VC presentMenuView:sender];
}

- (void)clickto:(UIBarButtonItem *)sender {
    
    ArrowheadMenu *VC = [[ArrowheadMenu alloc] initDefaultArrowheadMenuWithTitle:@[@"发起群聊", @"添加朋友", @"扫一扫"] icon:@[@"ListInspection", @"ListInspection", @"ListInspection"] menuPlacements:ShowAtBottom];
    
    VC.delegate = self;
    [VC presentMenuView:sender];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    CenterMenu *VC = [[CenterMenu alloc] initDefaultCenterMenuWithTitle:@[@"发起群聊", @"添加朋友", @"扫一扫"] icon:@[@"ListInspection", @"ListInspection", @"ListInspection"]];
    VC.delegate = self;
    [VC presentMenuView];
}

@end
