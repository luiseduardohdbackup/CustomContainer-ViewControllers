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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    
    btn.backgroundColor = [UIColor whiteColor];
    
    [btn addTarget:self action:@selector(presentLeftViewController) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(250, 50, 50, 50)];
    
    btn1.backgroundColor = [UIColor whiteColor];
    
    [btn1 addTarget:self action:@selector(presentBottomViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn];

}

- (void)presentLeftViewController {
    NSLog(@"-----Left");
    
    IvyLeftViewController *left = [[IvyLeftViewController alloc] init];
    
    [self addChildViewController:left];
    
//    left.view.frame = self.view.frame;
    
    [self.view addSubview:left.view];
    
    [left didMoveToParentViewController:self];
    
    [left beginAppearanceTransition:YES animated:YES];
    
//    [left transitionFromViewController:self toViewController:left duration:0.35 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
//    
//    } completion:^(BOOL finished) {
//        
//    }];
    
    [left endAppearanceTransition];
    
}

- (void)presentBottomViewController {
    
    if (self.view.tag == 1) {
        return;
    }
    
    self.view.tag = 1;
    
    IvyBottomViewController *btm = [[IvyBottomViewController alloc] init];
    
    [self addChildViewController:btm];
    
    [self.view addSubview:btm.view];
    
    [btm didMoveToParentViewController:self];

    [btm beginAppearanceTransition:YES animated:YES];
    
    [UIView beginAnimations:nil context:nil];
    [UIView animateWithDuration:0.35 animations:^{
        
        btm.view.center = CGPointMake(160, 284);
    } completion:^(BOOL finished) {
        self.view.tag = 0;
        [btm endAppearanceTransition];
    }];
    [UIView commitAnimations];
    
    
}

@end
