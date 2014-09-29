//
//  IvyLeftViewController.h
//  CustomContainer ViewControllers
//
//  Created by Ivy on 29/9/14.
//  Copyright (c) 2014年 Ivy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol sideMenuViewDelegate;

@interface IvyLeftViewController :UIViewController

@property (nonatomic, weak) id<sideMenuViewDelegate> delegate;

@end
