//
//  IvyContainerViewController.h
//  CustomContainer ViewControllers
//
//  Created by Ivy on 29/9/14.
//  Copyright (c) 2014年 Ivy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IvyContainerViewController : UIViewController

@property (nonatomic, strong) UIViewController *leftController;
@property (nonatomic, strong) UIViewController *bottomController;
@property (nonatomic, strong) UIView *blur;


- (id)initWithLeftViewController:(UIViewController *)left BottomViewController:(UIViewController *)bottom;

@end


#pragma mark menu切换代理方法
@protocol sideMenuViewDelegate <NSObject>

@optional
- (void)showLeftView;
- (void)hideLeftView;

- (void)showBottomView;
- (void)hideBottomView;

@end
