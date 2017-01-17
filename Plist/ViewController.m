//
//  ViewController.m
//  Plist
//
//  Created by Mac on 16/8/20.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "PlistViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
    
    
    
    
}
- (void)change{
    PlistViewController *plistVC = [PlistViewController new];
    [self.navigationController pushViewController:plistVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
