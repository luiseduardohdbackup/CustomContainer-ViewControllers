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

@interface IvyContainerViewController ()

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

- (id)initWithLeftViewController:(UIViewController *)left BottomViewController:(UIViewController *)bottom {
    
    if (self = [super init]) {
        
        self.left = left;
        self.bottom = bottom;
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    
    self.blur = [[UIView alloc] initWithFrame:self.view.frame];
    self.blur.backgroundColor = [UIColor whiteColor];
    self.blur.alpha = 0;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    
    btn.backgroundColor = [UIColor whiteColor];
    
    [btn addTarget:self action:@selector(presentLeftViewController) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(250, 50, 50, 50)];
    
    btn1.backgroundColor = [UIColor whiteColor];
    
    [btn1 addTarget:self action:@selector(presentBottomViewController) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.blur];
    [self.view addSubview:btn1];
    [self.view addSubview:btn];

}

- (void)presentLeftViewController {
    if (self.view.tag == 2) {
        return;
    }
    
    self.view.tag = 2;
    
    [self addChildViewController:self.left];
    
    [self.view addSubview:self.left.view];
    
    [self.left didMoveToParentViewController:self];
    
    [self.left beginAppearanceTransition:YES animated:YES];
    
    [UIView beginAnimations:nil context:nil];
    [UIView animateWithDuration:0.35 animations:^{
        
        self.left.view.center = CGPointMake(160, 284);
        self.blur.alpha = 0.3;
    } completion:^(BOOL finished) {
        self.view.tag = 3;
        
    }];
    [UIView commitAnimations];
    [self.left endAppearanceTransition];
    
}

- (void)presentBottomViewController {
    
    if (self.view.tag == 1) {
        return;
    }
    
    self.view.tag = 1;
    
    [self addChildViewController:self.bottom];
    
    [self.view addSubview:self.bottom.view];
    
    [self.bottom didMoveToParentViewController:self];

    [self.bottom beginAppearanceTransition:YES animated:YES];
    
    [UIView beginAnimations:nil context:nil];
    [UIView animateWithDuration:0.35 animations:^{
        
        self.bottom.view.center = CGPointMake(160, 284);
        self.blur.alpha = 0.3;
    } completion:^(BOOL finished) {
        self.view.tag = 0;
        
    }];
    [UIView commitAnimations];
    [self.bottom endAppearanceTransition];
    
}

@end
