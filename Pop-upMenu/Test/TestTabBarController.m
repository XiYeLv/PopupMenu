
//
//  TestTabBarController.m
//  Pop-upMenu
//
//  Created by EastSun on 2017/12/21.
//  Copyright © 2017年 EastSun. All rights reserved.
//

#import "TestTabBarController.h"
#import "ArrowheadMenu.h"

@interface TestTabBarController ()<MenuViewControllerDelegate>

/** 标题数组 */
@property (strong, nonatomic) NSArray *titleArray;

/** 控制器数组 */
@property (strong, nonatomic) NSArray *controllerArray;

@end

@implementation TestTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加控制器
    [self addControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    ArrowheadMenu *VC = [[ArrowheadMenu alloc] initDefaultArrowheadMenuWithTitle:@[@"发起群聊", @"添加朋友", @"扫一扫"] icon:@[@"ListInspection", @"ListInspection", @"ListInspection"] menuPlacements:ShowAtTop];
    
    VC.delegate = self;
    [VC presentMenuView:item];
}

// 菜单代理方法
- (void)menu:(BaseMenuViewController *)menu didClickedItemUnitWithTag:(NSInteger)tag andItemUnitTitle:(NSString *)title {
    NSLog(@"\n\n\n\n点击了第%lu项名字为%@的菜单项", tag, title);
}

#pragma mark- 添加控制器
- (void)addControllers{
    for (int i = 0; i < self.titleArray.count; i ++) {
        Class class = NSClassFromString(self.controllerArray[i]);
        UIViewController *VC = [[class alloc] init];
        VC.title = self.titleArray[i];
        [VC.tabBarItem setTitle:self.titleArray[i]];
        VC.tabBarItem.tag = i;
        
        [VC.tabBarItem setImage:[[UIImage imageNamed:@"tabbar0_n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [VC.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabbar0_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        UINavigationController *NaVC = [[UINavigationController alloc] initWithRootViewController:VC];
        [self addChildViewController:NaVC];
    }
    
    // 设置tabBarItem标题的选中字体颜色和图片的选中渲染色（图片渲染色必须在添加图片时没有设置图片的imageWithRenderingMode才有效）
    self.tabBar.translucent = NO;
    
}

#pragma mark- 懒加载
//MARK: 标题数组titleArray
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"弹出菜单",@"cell弹出菜单",@"测试选中状态菜单",@"test4"];
    }
    
    return _titleArray;
}

//MARK: 控制器数组controllerArray
- (NSArray *)controllerArray {
    if (!_controllerArray) {
        _controllerArray = @[@"TestViewController", @"TestTableViewController", @"TestArrowheadMenuSelectedStateViewController", @"TestViewController"];
        
    }
    
    return _controllerArray;
}

@end
