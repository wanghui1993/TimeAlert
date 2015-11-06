//
//  ThirdView.m
//  timeAlertT
//
//  Created by mac on 15-11-4小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import "ThirdView.h"
#import "PathOfFile.h"

@implementation ThirdView
{
    float _iflag;
    
    float _setion;
    
    float _totalTime;
    
    float _endAngle;
    
    float _startAngle;
}


//重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        _endAngle = - M_PI_2;
        
        _startAngle = - M_PI_2;
        
        [self whTimeRunLoop];
    }
    
    return self;
}

//获取本地数据
- (void)whRecevieLocalData{
    
    NSDictionary *dic = [PathOfFile whReceiveLocalDictionary];
    
    NSNumber *sectionDay = [dic objectForKey:@"sectionOfDay"];
    
    NSNumber *num = [dic objectForKey:@"flag"];
    
    NSNumber *dayTime = [dic objectForKey:@"dayTime"];
    
    NSNumber *hourTime = [dic objectForKey:@"houtTime"];
    
    NSNumber *minTime = [dic objectForKey:@"minTime"];
    
    _totalTime = [minTime floatValue] + [hourTime floatValue] +[dayTime floatValue];
    
    _iflag = [num floatValue];
    
    _setion = [sectionDay integerValue];
    
    if (_iflag != 0) {
        
        _endAngle = ((M_PI_2 *3)/_setion)*_iflag;
    }
}

//时间循环事件
- (void)whTimeRunLoop{
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(whTimeDo:) userInfo:nil repeats:YES];
}

//实现时间事件方法
- (void)whTimeDo:(NSTimer *)timer{
    
    [self whRecevieLocalData];
    
    [self setNeedsDisplay];
}

//图形绘画
- (void)drawRect:(CGRect)rect {
   
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    float centerX = self.center.x;
    
    float centerY = self.center.y;
    
    CGContextAddArc(context, centerX, centerY - 80, 200, -M_PI_2, M_PI_2 * 3, 0);
    
    [[UIColor grayColor] set];
    
    CGContextSetLineWidth(context, 5);
    
    CGContextFillPath(context);
    
    
    CGContextMoveToPoint(context, centerX, centerY - 80);
    
    CGContextAddArc(context, centerX, centerY - 80, 200, _startAngle, _endAngle, 0);
    
    [[UIColor purpleColor] set];
    
    CGContextSetLineWidth(context, 5);
    
    CGContextFillPath(context);
    
    
}

@end
