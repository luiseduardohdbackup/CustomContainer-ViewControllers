//
//  IvyLeftViewController.m
//  CustomContainer ViewControllers
//
//  Created by Ivy on 29/9/14.
//  Copyright (c) 2014年 Ivy. All rights reserved.
//

#import "IvyLeftViewController.h"

@interface IvyLeftViewController ()

@end

@implementation IvyLeftViewController

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
    
    self.view.backgroundColor = [UIColor clearColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    
    btn.backgroundColor = [UIColor whiteColor];
    
    [btn addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *leftPart = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 568)];
    
    leftPart.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:leftPart];
    [self.view addSubview:btn];
    
}

- (void)dismissViewController {
    
    if (self.view.tag == 1) {
        return;
    }
    
    self.view.tag = 1;
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView animateWithDuration:0.35 animations:^{
        self.view.center = CGPointMake(-160, 284);
    } completion:^(BOOL finished) {
        self.view.tag = 0;
    }];
    
    [UIView commitAnimations];
}

@end
