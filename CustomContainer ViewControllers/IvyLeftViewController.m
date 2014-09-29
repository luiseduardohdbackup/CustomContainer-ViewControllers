//
//  IvyLeftViewController.m
//  CustomContainer ViewControllers
//
//  Created by Ivy on 29/9/14.
//  Copyright (c) 2014年 Ivy. All rights reserved.
//

#import "IvyLeftViewController.h"
#import "IvyContainerViewController.h"

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
    
    // 初始化leftViewController
    self.view.frame = CGRectMake(0, 0, 260, 568);
    self.view.backgroundColor = [UIColor purpleColor];
    
    // 添加返回Button
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self.delegate action:@selector(hideLeftView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

@end
