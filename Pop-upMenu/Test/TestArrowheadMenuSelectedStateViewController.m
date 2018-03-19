//
//  TestArrowheadMenuSelectedStateViewController.m
//  Pop-upMenu
//
//  Created by EastSun on 2018/3/19.
//  Copyright © 2018年 EastSun. All rights reserved.
//

#import "TestArrowheadMenuSelectedStateViewController.h"
#import "ArrowheadMenuSelectedState.h"// 状态弹窗菜单

/** RGB颜色 */
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]

@interface TestArrowheadMenuSelectedStateViewController ()<MenuViewControllerDelegate>

// 单选菜单
@property (nonatomic, strong) ArrowheadMenuSelectedState *singleMenu;
// 多选菜单
@property (nonatomic, strong) ArrowheadMenuSelectedState *selectMenu;

@end

@implementation TestArrowheadMenuSelectedStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"单选菜单" style:UIBarButtonItemStyleDone target:self action:@selector(clickSingleMenu:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"多选菜单" style:UIBarButtonItemStyleDone target:self action:@selector(clickSelectMenu:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- 菜单代理方法
- (void)menu:(BaseMenuViewController *)menu didClickedMenuItemUnitWithTag:(NSInteger)tag andItemUnitTitle:(NSString *)title itemiUnitPostClickState:(BOOL)state {
    
    if (menu == self.singleMenu) {
        NSLog(@"单选菜单");
    } else if (menu == self.selectMenu) {
        NSLog(@"多选菜单");
    }
    
    NSLog(@"%ld---%@---%d", tag, title, state);
    
}

- (void)clickSelectMenu:(UIBarButtonItem *)sender {
    [self.selectMenu presentMenuView:sender];
}

- (void)clickSingleMenu:(UIBarButtonItem *)sender {
    [self.singleMenu presentMenuView:sender];
}

- (ArrowheadMenuSelectedState *)singleMenu {
    if (!_singleMenu) {
        
        _singleMenu = [[ArrowheadMenuSelectedState alloc] initCustomArrowheadStatusMenuWithNormalTitle:@[@"监控点", @"RFID点", @"水位测点", @"水质测点", @"巡检", @"GPS路径", @"巡检路径"] selectedTitle:@[@"监控点", @"RFID点", @"水位测点", @"水质测点", @"巡检", @"GPS路径", @"巡检路径"] normalIcon:@[@"ListMonitor", @"ListRFID", @"ListWaterLevel", @"ListWaterQuality", @"ListInspection", @"ListGPS", @"ListInspectionPath"] selectedIcon:@[@"ListMonitor", @"ListRFID", @"ListWaterLevel", @"ListWaterQuality", @"ListInspection", @"ListGPS", @"ListInspectionPath"] menuNormalTitleColorArray:@[RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1)] menuSelectedTitleColorArray:@[RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1)] menuUnitSize:CGSizeMake([UIScreen mainScreen].bounds.size.width/3+5, 38) menuFont:[UIFont fontWithName:@"Helvetica" size:15.f] menuBackColor:RGBACOLOR(248, 247, 242, 0.8) menuSegmentingLineColor:RGBACOLOR(215, 215, 215, 1) distanceFromTriggerSwitch:-5 menuArrowStyle:MenuArrowStyleRound menuPlacements:ShowAtBottom showAnimationEffects:ShowAnimationZoom];
        
        _singleMenu.delegate = self;
    }
    return _singleMenu;
}

- (ArrowheadMenuSelectedState *)selectMenu {
    if(!_selectMenu) {
        _selectMenu = [[ArrowheadMenuSelectedState alloc] initCustomArrowheadStatusMenuWithNormalTitle:@[@"监控点", @"RFID点", @"水位测点", @"水质测点", @"巡检", @"GPS路径", @"巡检路径"] selectedTitle:@[@"监控点", @"RFID点", @"水位测点", @"水质测点", @"巡检", @"GPS路径", @"巡检路径"] normalIcon:@[@"ListMonitor", @"ListRFID", @"ListWaterLevel", @"ListWaterQuality", @"ListInspection", @"ListGPS", @"ListInspectionPath"] selectedIcon:@[@"ListMonitor", @"ListRFID", @"ListWaterLevel", @"ListWaterQuality", @"ListInspection", @"ListGPS", @"ListInspectionPath"] menuNormalTitleColorArray:@[RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1)] menuSelectedTitleColorArray:@[RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1)] menuUnitSize:CGSizeMake([UIScreen mainScreen].bounds.size.width/3+5, 38) menuFont:[UIFont fontWithName:@"Helvetica" size:15.f] menuBackColor:RGBACOLOR(248, 247, 242, 0.8) menuSegmentingLineColor:RGBACOLOR(215, 215, 215, 1) distanceFromTriggerSwitch:-5 menuArrowStyle:MenuArrowStyleRound menuPlacements:ShowAtBottom showAnimationEffects:ShowAnimationZoom];
        
        _selectMenu.delegate = self;
        _selectMenu.allowsMultipleSelection = YES;
    }
    
    return _selectMenu;
}

@end
