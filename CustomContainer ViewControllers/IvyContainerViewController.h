//
//  IvyContainerViewController.h
//  CustomContainer ViewControllers
//
//  Created by Ivy on 29/9/14.
//  Copyright (c) 2014年 Ivy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IvyContainerViewController : UIViewController

@property (nonatomic, strong) UIViewController *left;
@property (nonatomic, strong) UIViewController *bottom;

@property (nonatomic, strong) UIView *blur;

- (id)initWithLeftViewController:(UIViewController *)left BottomViewController:(UIViewController *)bottom;


@end
