//
//  IvyBottomViewController.m
//  CustomContainer ViewControllers
//
//  Created by Ivy on 29/9/14.
//  Copyright (c) 2014年 Ivy. All rights reserved.
//

#import "IvyBottomViewController.h"

@interface IvyBottomViewController ()

@end

@implementation IvyBottomViewController

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
    
    self.view.center = CGPointMake(160, 568*1.5);
    
    self.view.backgroundColor = [UIColor blueColor];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(250, 50, 50, 50)];
    
    btn.backgroundColor = [UIColor whiteColor];
    
    [btn addTarget:self action:@selector(dismissViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)dismissViewController {
    
    if (self.view.tag == 1) {
        return;
    }
    
    self.view.tag = 1;
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView animateWithDuration:0.35 animations:^{
        self.view.center = CGPointMake(160, 568*1.5);
        [self.parentViewController setValue:@0.0 forKeyPath:@"blur.alpha"];
    } completion:^(BOOL finished) {
        self.view.tag = 0;
    }];
    
    [UIView commitAnimations];
}


@end
