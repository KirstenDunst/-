//
//  DrawView.m
//  Plist
//
//  Created by Mac on 16/8/20.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()
@property(nonatomic,retain)NSMutableArray *PointArr;
@property(nonatomic,retain)NSArray *dateArr;
@property(nonatomic,retain)NSArray *numberArr;
@end

@implementation DrawView
- (NSMutableArray *)PointArr{
    if (!_PointArr) {
        _PointArr = [NSMutableArray array];
    }
    return _PointArr;
}
- (void)reloadViewWithDateArr:(NSArray *)dateArr andWithNumberArr:(NSArray *)numberArr {
    self.dateArr = dateArr;
    self.numberArr = numberArr;
    [self createView];
}
- (void)createView {
    for (int i = 0; i<self.dateArr.count; i++) {
        UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0+i*40, self.frame.size.height-30, 40, 20)];
        dateLabel.font = [UIFont systemFontOfSize:12];
        dateLabel.textAlignment = NSTextAlignmentCenter;
        dateLabel.text = self.dateArr[i];
        dateLabel.tag = 1+i;
        [self addSubview:dateLabel];
    }
    
    for (int i = 0; i<self.numberArr.count; i++) {
        UILabel *dateLab = [self viewWithTag:i+1];
        UILabel *labelCell = [UILabel new];
        labelCell.center = CGPointMake(dateLab.center.x, 200-[self.numberArr[i] integerValue]/1000.0*200);
        labelCell.bounds = CGRectMake(0, 0, 30, 20);
        labelCell.text = self.numberArr[i];
        labelCell.font = [UIFont systemFontOfSize:12];
        [self addSubview:labelCell];
        [self.PointArr addObject:labelCell];
    }
    [self setNeedsDisplay];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    if (self.PointArr.count==0) {
        return;
    }
    //1.获得当前上下文来绘图
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.开始绘图
    CGContextBeginPath(context);
    for (int i=0; i<self.PointArr.count; i++) {
        CGPoint point = [self.PointArr[i] center];
        if (i==0) {
            CGContextMoveToPoint(context, point.x, point.y);
        }else{
            CGContextAddLineToPoint(context, point.x, point.y);
        }
    }
    //线条颜色
    [[UIColor redColor] setStroke];
    //描线
    CGContextStrokePath(context);
}
@end
