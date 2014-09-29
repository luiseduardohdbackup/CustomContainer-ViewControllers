//
//  IvyContainerViewController.m
//  CustomContainer ViewControllers
//
//  Created by Ivy on 29/9/14.
//  Copyright (c) 2014年 Ivy. All rights reserved.
//

#import "IvyContainerViewController.h"
#import "IvyLeftViewController.h"
#import "IvyBottomViewController.h"

@interface IvyContainerViewController () <sideMenuViewDelegate>

@property (nonatomic, strong) UIView *left;
@property (nonatomic, strong) UIView *cover;

@end

@implementation IvyContainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark 初始化ViewController
- (id)initWithLeftViewController:(UIViewController *)leftController BottomViewController:(UIViewController *)bottomController {
    
    if (self = [super init]) {
        
        self.leftController = leftController;
        self.bottomController = bottomController;
    }

    return self;
}

#pragma mark 初始化
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // 初始化view
    self.left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 568)];
    self.cover = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    
    self.left.backgroundColor = [UIColor yellowColor];
    self.cover.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.left];
    [self.view addSubview:self.cover];
    
    // 初始化blurView
    self.blur = [[UIView alloc] initWithFrame:self.view.frame];
    self.blur.backgroundColor = [UIColor darkGrayColor];
    self.blur.alpha = 0;
    [self.cover addSubview:self.blur];
    
    // 初始化coverView
    // --leftButton
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    btn1.backgroundColor = [UIColor whiteColor];
    [btn1 addTarget:self action:@selector(showLeftView) forControlEvents:UIControlEventTouchUpInside];
    [self.cover addSubview:btn1];
    
    // --BottomButton
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(250, 50, 50, 50)];
    btn2.backgroundColor = [UIColor whiteColor];
    [btn2 addTarget:self action:@selector(showBottomView) forControlEvents:UIControlEventTouchUpInside];
    [self.cover addSubview:btn2];

}

#pragma mark - 实现代理方法
#pragma mark 隐藏左菜单
- (void)hideLeftView {
    /*
     --------------------------
     if (self.view.tag == 1) {
     return;
     }
     
     self.view.tag = 1;
     .
     .
     self.view.tag = 0;
     
     确保动画完整运行
     --------------------------
     */
    if (self.view.tag == 1) {
        return;
    }
    
    self.view.tag = 1;
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView animateWithDuration:0.35 animations:^{
        self.cover.frame = CGRectMake(0, 0, 320, 568);
        self.blur.alpha = 0;
    } completion:^(BOOL finished) {
        self.view.tag = 0;
    }];
    
    [UIView commitAnimations];
}

#pragma mark 显示左菜单
- (void)showLeftView {
    /*
     ----------------------------------------------------------
     [self addChildViewController:self.leftController];
     
     [self.left addSubview:self.leftController.view];
     
     [self.leftController didMoveToParentViewController:self];
     
     绑定ContainerViewCOntroller和LeftViewController的父子关系
     并设置LeftViewController的view为self.left的子View
     
     ----------------------------------------------------------

     */
    if (self.view.tag == 2) {
        return;
    }

    self.view.tag = 2;

    [self addChildViewController:self.leftController];

    [self.left addSubview:self.leftController.view];

    [self.leftController didMoveToParentViewController:self];

    [self.leftController beginAppearanceTransition:YES animated:YES];
    
    [UIView beginAnimations:nil context:nil];
    [UIView animateWithDuration:0.35 animations:^{

        self.cover.frame = CGRectMake(260, 0, 320, 568);
        self.blur.alpha = 0.3;
        
    } completion:^(BOOL finished) {
        self.view.tag = 3;
    }];
    [UIView commitAnimations];
    
    [self.leftController endAppearanceTransition];
    
}

#pragma mark 隐藏底部菜单
- (void)hideBottomView {
    
    if (self.view.tag == 1) {
        return;
    }
    
    self.view.tag = 1;
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView animateWithDuration:0.35 animations:^{
        self.bottomController.view.center = CGPointMake(160, 568*1.5);
        self.blur.alpha = 0;
    } completion:^(BOOL finished) {
        self.view.tag = 0;
    }];
    
    [UIView commitAnimations];
}

#pragma mark 显示底部菜单
- (void)showBottomView {
    
    if (self.view.tag == 1) {
        return;
    }
    
    self.view.tag = 1;
    
    [self addChildViewController:self.bottomController];
    
    [self.view addSubview:self.bottomController.view];
    
    [self.bottomController didMoveToParentViewController:self];
    
    [self.bottomController beginAppearanceTransition:YES animated:YES];
    
    [UIView beginAnimations:nil context:nil];
    [UIView animateWithDuration:0.35 animations:^{
        
        self.bottomController.view.center = CGPointMake(160, 284);
        self.blur.alpha = 0.3;
    } completion:^(BOOL finished) {
        self.view.tag = 0;
        
    }];
    [UIView commitAnimations];
    [self.bottomController endAppearanceTransition];
}

@end
