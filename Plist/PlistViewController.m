//
//  PlistViewController.m
//  Plist
//
//  Created by Mac on 16/8/20.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "PlistViewController.h"
#import "DrawView.h"

@interface PlistViewController ()

@end

@implementation PlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *dateArr = [NSArray arrayWithObjects:@"8.1",@"8.2",@"8.3",@"8.4",@"8.1",@"8.2",@"8.3", nil];
    NSArray *numberArr =[NSArray arrayWithObjects:@"0",@"300",@"700",@"1000",@"1000",@"300",@"700", nil];
    [self drawLineAtWithDate:dateArr andConcertNumber:numberArr];
}
- (void)drawLineAtWithDate:(NSArray *)DateArr andConcertNumber:(NSArray *)NumberArr{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, 230)];
    [self.view addSubview:backView];
    backView.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i<6; i++) {
        NSString *str = [NSString stringWithFormat:@"%d",1000-i*200];
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(20, 10+40*i, 30, 10);
        label.backgroundColor = [UIColor cyanColor];
        label.text = str;
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:12];
        [backView addSubview:label];
    }
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(50, 10, backView.frame.size.width-70, 220)];
    scrollView.backgroundColor = [UIColor whiteColor];
    [backView addSubview:scrollView];
    
    DrawView *drawView = [[DrawView alloc]init];
    drawView.frame = CGRectMake(0, 10, 40+DateArr.count*40, scrollView.frame.size.height);
    drawView.backgroundColor = [UIColor whiteColor];
    [drawView reloadViewWithDateArr:DateArr andWithNumberArr:NumberArr];
    [scrollView addSubview:drawView];
    scrollView.contentSize = CGSizeMake(drawView.frame.size.width, 0);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
