# 目录

- [效果](#效果)
- [要求](#要求)
- [安装](#安装)
- [使用](#使用)


# 效果
* ![图片](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.15.png?raw=true)  
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.22.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.27.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.29.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.32.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.35.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.37.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.39.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.42.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.45.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.56.48.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.57.00.png?raw=true)
* ![](https://github.com/XiYeLv/PopupMenu/blob/master/DisplayResources/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-03-19%20at%2017.57.08.png?raw=true)

# 要求   
* iOS 8.0+ 

# 安装
## Manually  
将XYMenu文件夹放入工程

# 使用   
## ArrowheadMenu使用    
相关API：
  
```
#pragma mark- 默认风格

/**
 默认UI风格菜单,快速创建菜单
 
 @param titleArray 菜单单元标题
 @param iconArray 菜单单元图标，存放image的名字字符串
 @param placements 菜单相对于触发菜单的控件的位置（上、下、左、右四种）
 @return 返回菜单对象
 */
- (instancetype _Nullable)initDefaultArrowheadMenuWithTitle:(NSArray<NSString *>  *_Nonnull)titleArray icon:(NSArray<NSString *>  *_Nullable)iconArray menuPlacements:(MenuPlacements)placements;

/**
 自定义UI风格创建菜单，根据自己风格设置菜单UI元素

 @param titleArray 菜单单元标题
 @param iconArray 菜单单元图标，存放image的名字字符串
 @param size 菜单单元格的大小（宽和高）
 @param font 菜单标题字体
 @param fontColor 菜单字体颜色
 @param menuBackColor 菜单背景颜色
 @param separatorColor 菜单单元分割线颜色
 @param interval 菜单距离触发菜单的控件的距离，可为负数
 @param arrowStyle 菜单箭头的风格，尖角和圆角两种
 @param placements 菜单相对于触发菜单的控件的位置（上、下、左、右四种）
 @param animation 菜单弹出动画
 @return 返回菜单对象
 */
- (instancetype _Nullable)initCustomArrowheadMenuWithTitle:(NSArray<NSString *>  *_Nonnull)titleArray icon:(NSArray<NSString *>  *_Nullable)iconArray menuUnitSize:(CGSize)size menuFont:(UIFont * _Nullable)font menuFontColor:(UIColor * _Nullable)fontColor menuBackColor:(UIColor *_Nullable)menuBackColor menuSegmentingLineColor:(UIColor *_Nullable)separatorColor distanceFromTriggerSwitch:(CGFloat)interval menuArrowStyle:(MenuArrowStyle)arrowStyle menuPlacements:(MenuPlacements)placements showAnimationEffects:(MenuShowAnimationStyle)animation;

/**
 菜单展示API

 @param sender 触发菜单的控件
 */
- (void)presentMenuView:(NSObject *_Nonnull)sender;
```  

协议方法：   

```
/**
 使用不带选中状态的菜单需要实现的协议方法

 @param tag 被点击的菜单单元标志值
 @param title 被点击的菜单单元标题
 */
- (void)menu:(BaseMenuViewController *)menu didClickedItemUnitWithTag:(NSInteger)tag andItemUnitTitle:(NSString *)title;
```

使用案例：   

```
ArrowheadMenu *menu = [[ArrowheadMenu alloc] initDefaultArrowheadMenuWithTitle:@[@"发起群聊", @"添加朋友", @"扫一扫"] icon:@[@"ListInspection", @"ListInspection", @"ListInspection"] menuPlacements:ShowAtTop];
menu.delegate = self;
[menu presentMenuView:item];
```

## CenterMenu使用   
相关API：  

```
#pragma mark- 默认风格
- (instancetype _Nullable)initDefaultCenterMenuWithTitle:(NSArray<NSString *>  *_Nonnull)titleArray icon:(NSArray<NSString *>  *_Nullable)iconArray;

#pragma mark- 自定义风格
- (instancetype _Nullable)initCustomCenterMenuWithTitle:(NSArray<NSString *>  *_Nonnull)titleArray icon:(NSArray<NSString *>  *_Nullable)iconArray menuUnitSize:(CGSize)size  menuCornerRadius:(CGFloat)menuRoundedRadius menuFont:(UIFont * _Nullable)font menuFontColor:(UIColor * _Nullable)fontColor menuBackColor:(UIColor *_Nullable)menuBackColor menuSegmentingLineColor:(UIColor *_Nullable)separatorColor menuMaskColor:(UIColor *_Nullable)menuMaskColor;
```
协议方法：   

```
/**
 使用不带选中状态的菜单需要实现的协议方法

 @param tag 被点击的菜单单元标志值
 @param title 被点击的菜单单元标题
 */
- (void)menu:(BaseMenuViewController *)menu didClickedItemUnitWithTag:(NSInteger)tag andItemUnitTitle:(NSString *)title;
```

使用案例：  

```
CenterMenu *centerMenu = [[CenterMenu alloc] initDefaultCenterMenuWithTitle:@[@"发起群聊", @"添加朋友", @"扫一扫"] icon:@[@"ListInspection", @"ListInspection", @"ListInspection"]];
centerMenu.delegate = self;
[centerMenu presentMenuView];
```

# ArrowheadMenuSelectedState使用
相关API:  

```
/**
 是否允许多选，默认是单选
 */
@property (nonatomic, assign) BOOL allowsMultipleSelection;

#pragma mark- 默认风格

/**
 默认UI风格创建菜单

 @param normalTitleArray 非选中状态下，菜单单元标题
 @param selectedTitleArray 选中状态下，菜单单元标题
 @param normalIconArray 非选中状态下，菜单单元图标，存放image的名字字符串
 @param selectedIconArray 选中状态下，菜单单元图标，存放image的名字字符串
 @param normalTitleColor 非选中状态下，菜单单元字体颜色
 @param selectedTitleColor 选中状态下，菜单单元字体颜色
 @param placements 菜单相对于触发菜单的控件的位置（上、下、左、右四种）
 @return 返回菜单对象
 */
- (instancetype _Nullable)initDefaultArrowheadStatusMenuWithNormalTitle:(NSArray<NSString *>  *_Nonnull)normalTitleArray selectedTitle:(NSArray<NSString *>  *_Nonnull)selectedTitleArray normalIcon:(NSArray<NSString *>  *_Nullable)normalIconArray selectedIcon:(NSArray<NSString *>  *_Nullable)selectedIconArray menuNormalTitleColor:(UIColor * _Nullable)normalTitleColor menuSelectedTitleColor:(UIColor * _Nullable)selectedTitleColor menuPlacements:(MenuPlacements)placements;

#pragma mark- 自定义风格
/**
 自定义UI风格创建菜单，根据自己风格设置菜单UI元素，菜单每个单元的非选中状态下字体颜色相同，菜单每个单元的选中状态下字体颜色也相同

 @param normalTitleArray 非选中状态下，菜单单元标题
 @param selectedTitleArray 选中状态下，菜单单元标题
 @param normalIconArray 非选中状态下，菜单单元图标，存放image的名字字符串
 @param selectedIconArray 选中状态下，菜单单元图标，存放image的名字字符串
 @param normalTitleColor 非选中状态下，菜单单元字体颜色
 @param selectedTitleColor 选中状态下，菜单单元字体颜色
 @param size 菜单单元格的大小（宽和高）
 @param font 菜单单元格标题字体
 @param menuBackColor 菜单背景颜色
 @param separatorColor 菜单单元分割线颜色
 @param interval 菜单距离触发菜单的控件的距离，可为负数
 @param arrowStyle 菜单箭头的风格，尖角和圆角两种
 @param placements 菜单相对于触发菜单的控件的位置（上、下、左、右四种）
 @param animation 菜单弹出动画
 @return 返回菜单对象
 */
- (instancetype _Nullable)initCustomArrowheadStatusMenuWithNormalTitle:(NSArray<NSString *>  *_Nonnull)normalTitleArray selectedTitle:(NSArray<NSString *>  *_Nonnull)selectedTitleArray normalIcon:(NSArray<NSString *>  *_Nullable)normalIconArray selectedIcon:(NSArray<NSString *>  *_Nullable)selectedIconArray menuNormalTitleColor:(UIColor * _Nonnull)normalTitleColor menuSelectedTitleColor:(UIColor * _Nonnull)selectedTitleColor  menuUnitSize:(CGSize)size menuFont:(UIFont * _Nonnull)font menuBackColor:(UIColor *_Nonnull)menuBackColor menuSegmentingLineColor:(UIColor *_Nonnull)separatorColor distanceFromTriggerSwitch:(CGFloat)interval menuArrowStyle:(MenuArrowStyle)arrowStyle menuPlacements:(MenuPlacements)placements showAnimationEffects:(MenuShowAnimationStyle)animation;

/**
 自定义UI风格创建菜单，根据自己风格设置菜单UI元素，菜单每个单元的非选中状态下字体颜色不相同，菜单每个单元的选中状态下字体颜色也不相同 
 
 @param normalTitleArray 非选中状态下，菜单单元标题
 @param selectedTitleArray 选中状态下，菜单单元标题
 @param normalIconArray 非选中状态下，菜单单元图标，存放image的名字字符串
 @param selectedIconArray 选中状态下，菜单单元图标，存放image的名字字符串
 @param normalTitleColorArray 非选中状态下，菜单单元字体颜色
 @param selectedTitleColorArray 选中状态下，菜单单元字体颜色
 @param size 菜单单元格的大小（宽和高）
 @param font 菜单单元格标题字体
 @param menuBackColor 菜单背景颜色
 @param separatorColor 菜单单元分割线颜色
 @param interval 菜单距离触发菜单的控件的距离，可为负数
 @param arrowStyle 菜单箭头的风格，尖角和圆角两种
 @param placements 菜单相对于触发菜单的控件的位置（上、下、左、右四种）
 @param animation 菜单弹出动画
 @return 返回菜单对象
 */
- (instancetype _Nullable)initCustomArrowheadStatusMenuWithNormalTitle:(NSArray<NSString *>  *_Nonnull)normalTitleArray selectedTitle:(NSArray<NSString *>  *_Nonnull)selectedTitleArray normalIcon:(NSArray<NSString *>  *_Nullable)normalIconArray selectedIcon:(NSArray<NSString *>  *_Nullable)selectedIconArray menuNormalTitleColorArray:(NSArray<UIColor *>  *_Nonnull)normalTitleColorArray menuSelectedTitleColorArray:(NSArray<UIColor *>  *_Nonnull)selectedTitleColorArray  menuUnitSize:(CGSize)size menuFont:(UIFont * _Nonnull)font menuBackColor:(UIColor *_Nonnull)menuBackColor menuSegmentingLineColor:(UIColor *_Nonnull)separatorColor distanceFromTriggerSwitch:(CGFloat)interval menuArrowStyle:(MenuArrowStyle)arrowStyle menuPlacements:(MenuPlacements)placements showAnimationEffects:(MenuShowAnimationStyle)animation;


/**
 菜单展示API
 
 @param sender 触发菜单的控件
 */
- (void)presentMenuView:(NSObject *_Nonnull)sender;

/**
 菜单项消除选中状态

 @param tag 菜单的tag标志值
 */
- (void)whenClickedUncheckOwnStatus:(NSInteger)tag;
```
协议方法：   

```
/**
 使用带选中状态的菜单需要实现的协议方法

 @param tag 被点击的菜单单元标志值
 @param title 被点击的菜单单元标题
 @param state 菜单单元点击后的状态
 */
- (void)menu:(BaseMenuViewController *)menu didClickedMenuItemUnitWithTag:(NSInteger)tag andItemUnitTitle:(NSString *)title itemiUnitPostClickState :(BOOL)state;
```

使用案例：

```
// 创建菜单对象
- (ArrowheadMenuSelectedState *)selectMenu {
    if(!_selectMenu) {
        _selectMenu = [[ArrowheadMenuSelectedState alloc] initCustomArrowheadStatusMenuWithNormalTitle:@[@"监控点", @"RFID点", @"水位测点", @"水质测点", @"巡检", @"GPS路径", @"巡检路径"] selectedTitle:@[@"监控点", @"RFID点", @"水位测点", @"水质测点", @"巡检", @"GPS路径", @"巡检路径"] normalIcon:@[@"ListMonitor", @"ListRFID", @"ListWaterLevel", @"ListWaterQuality", @"ListInspection", @"ListGPS", @"ListInspectionPath"] selectedIcon:@[@"ListMonitor", @"ListRFID", @"ListWaterLevel", @"ListWaterQuality", @"ListInspection", @"ListGPS", @"ListInspectionPath"] menuNormalTitleColorArray:@[RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1), RGBACOLOR(101, 100, 100, 1)] menuSelectedTitleColorArray:@[RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1), RGBACOLOR(0, 160, 241, 1)] menuUnitSize:CGSizeMake([UIScreen mainScreen].bounds.size.width/3+5, 38) menuFont:[UIFont fontWithName:@"Helvetica" size:15.f] menuBackColor:RGBACOLOR(248, 247, 242, 0.8) menuSegmentingLineColor:RGBACOLOR(215, 215, 215, 1) distanceFromTriggerSwitch:-5 menuArrowStyle:MenuArrowStyleRound menuPlacements:ShowAtBottom showAnimationEffects:ShowAnimationZoom];
        
        _selectMenu.delegate = self;
        _selectMenu.allowsMultipleSelection = YES;
    }
    
    return _selectMenu;
}

// 菜单展示
- (void)clickSelectMenu:(UIBarButtonItem *)sender {
    [self.selectMenu presentMenuView:sender];
}

// 协议实现
#pragma mark- 菜单代理方法
- (void)menu:(BaseMenuViewController *)menu didClickedMenuItemUnitWithTag:(NSInteger)tag andItemUnitTitle:(NSString *)title itemiUnitPostClickState:(BOOL)state {
    
    if (menu == self.singleMenu) {
        NSLog(@"单选菜单");
    } else if (menu == self.selectMenu) {
        NSLog(@"多选菜单");
    }
    
    NSLog(@"%ld---%@---%d", tag, title, state);
    
}
```


  
   








