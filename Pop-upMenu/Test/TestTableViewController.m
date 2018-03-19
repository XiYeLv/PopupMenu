//
//  TestTableViewController.m
//  Pop-upMenu
//
//  Created by EastSun on 2018/3/19.
//  Copyright © 2018年 EastSun. All rights reserved.
//

#import "TestTableViewController.h"
#import "ArrowheadMenu.h"

@interface TestTableViewController ()<MenuViewControllerDelegate>

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld---%ld", indexPath.row, indexPath.section];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ArrowheadMenu *VC = [[ArrowheadMenu alloc] initDefaultArrowheadMenuWithTitle:@[@"发起群聊", @"添加朋友", @"扫一扫"] icon:nil menuPlacements:ShowAtBottom];
    
    VC.delegate = self;
    [VC presentMenuView:cell];
}

#pragma mark - 菜单代理方法
- (void)menu:(BaseMenuViewController *)menu didClickedItemUnitWithTag:(NSInteger)tag andItemUnitTitle:(NSString *)title {
    
    NSLog(@"\n\n\n\n点击了第%lu项名字为%@的菜单项", tag, title);
    
}

@end
