//
//  XMMainViewController.m
//  sinaWeiBo
//
//  Created by 孟发 on 4/6/16.
//  Copyright © 2016 夏孟发. All rights reserved.
//

#import "XMMainViewController.h"
#import "XMHomeTableViewController.h"
#import "XMMessageTableViewController.h"
#import "XMDiscoverTableViewController.h"
#import "XMProfileTableViewController.h"

@interface XMMainViewController ()

@property (nonatomic, weak)UIButton *composedButton;

@end

@implementation XMMainViewController

#pragma mark 懒加载
//- (UIButton *)composedButton{
//    if (_composedButton == nil) {
//        _composedButton = [[UIButton alloc] init];
//    }
//    return _composedButton;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建控制器
    [self setupControllers];
    //添加撰写button
    [self setupComposedButton];
}

/**
 *  创建button
 */
- (void)setupComposedButton{
    
    UIButton *composedButton = [[UIButton alloc] init];
    //设置撰写按钮->添加按钮
    [self.tabBar addSubview:composedButton];
    
    [composedButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [composedButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [composedButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [composedButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    
    self.composedButton = composedButton;
    
    //设置按钮
    CGFloat count = self.childViewControllers.count;
    CGFloat w = self.tabBar.bounds.size.width / count;
    composedButton.frame = CGRectInset(self.tabBar.bounds, 2 * w, 0);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.tabBar bringSubviewToFront:self.composedButton];
}
/**
 *  加载控制器
 */
- (void)setupControllers{
    //加载控制器
    [self setupController:[[XMHomeTableViewController alloc] init] title:@"首页" imageName:@"tabbar_home"];
    [self setupController:[[XMHomeTableViewController alloc] init] title:@"消息" imageName:@"tabbar_message_center"];
    
    [self setupController:[[UIViewController alloc] init] title:nil imageName:nil];
    
    
    [self setupController:[[XMHomeTableViewController alloc] init] title:@"发现" imageName:@"tabbar_discover"];
    [self setupController:[[XMHomeTableViewController alloc] init] title:@"我" imageName:@"tabbar_profile"];

}

/**
 *  创建控制器
 */
- (void)setupController:(UIViewController *)Vc title:(NSString *)title imageName:(NSString *)imageName{
    
    Vc.title = title;
    Vc.tabBarItem.image = [UIImage imageNamed:imageName];
    Vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@ + _hightlighted",imageName]];
    Vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255.0)/255.0 green:(255.0)/255.0 blue:(255.0)/255.0 alpha:1];
    self.tabBar.tintColor = [UIColor orangeColor];
    
    //导航控制器
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:Vc];
    
    [self addChildViewController:navc];
    
}

@end
