//
//  SecondView.m
//  timeAlert
//
//  Created by mac on 15-11-2小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import "SecondView.h"
#import "SettingViewController.h"
#import "Model.h"
#import "PathOfFile.h"
#import "AppDelegate.h"

@implementation SecondView{
    
    int _totalday;
    
    int _totalSec;
    
    int _min;
    
    int _sec;
    
    float _time;
    
    Model *_model;
    
    UITabBarController *_tabBar;
    
}

- (IBAction)start:(UIButton *)sender {
    
    [self whReceviceLocalData];
    
    [self whWriteLocalValue];
    
    sender.hidden = YES;
    
    _imgV.hidden = YES;
    
    [self timerRunLoop];
    
    _model = [Model shareInstance];
    
    [self whDataValue];
    
    _maskButton.hidden = NO;
    
    _timeLabel.hidden = NO;
    
//    [self whMaskTabBar];
    
    _tabBar = [self whMaskTabBar];
    
    _tabBar.tabBar.hidden = YES;
}

//获取本地值
- (void)whReceviceLocalData{
    
    NSDictionary *dic = [PathOfFile whReceiveLocalDictionary];
    
    NSNumber *sectionDay = [dic objectForKey:@"sectionOfDay"];
    
    NSLog(@"%u",[sectionDay unsignedIntValue]);
    
    NSNumber *num = [dic objectForKey:@"flag"];
    
    if ([num intValue] == [sectionDay intValue]) {
        
        [dic setValue:@(0) forKey:@"flag"];
        
        [dic writeToFile:[PathOfFile whFilePath] atomically:YES];
        
        [self whAlertController];
        
        return;
    }
}

//创建警示框
- (void)whAlertController{
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"警告" message:@"恭喜你！完成了今天的任务。是否继续？？？" preferredStyle:UIAlertControllerStyleAlert];
    
    UIViewController *secVC = (UIViewController *)self.nextResponder;
    
    [secVC presentViewController:alertC animated:YES completion:nil];
    
    UIAlertAction *alertCancel = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        return ;
    }];
    
    UIAlertAction *alertSure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    [alertC addAction:alertSure];
    
    [alertC addAction:alertCancel];
}

//隐藏tabBar
- (UITabBarController *)whMaskTabBar{
    
    UIApplication *app = [UIApplication sharedApplication];
    
    UIViewController *VC = app.keyWindow.rootViewController;
    
    UITabBarController *tabbar = nil;
    
    for (id v in VC.view.subviews) {
        
        if ([v isKindOfClass:[UITabBarController class]]) {
            
//            [(UITabBar *)v setHidden:YES];
            
            tabbar = (UITabBarController *)v;
        }
    }
    
    return tabbar;
    
}


- (IBAction)maskBtn:(UIButton *)sender {
    
        _alertLabel.hidden = NO;

}

//判断是否存在数据
- (void)whDataValue{
    
    NSString *filePath = [PathOfFile whFilePath];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    if (dic) {
        
        NSNumber *dayTime = [dic objectForKey:@"dayTime"];
        
        NSNumber *hourTime = [dic objectForKey:@"houtTime"];
        
        NSNumber *minTime = [dic objectForKey:@"minTime"];
        
        _model.dayData = [dayTime floatValue];
        
        _model.hourData = [hourTime floatValue];
        
        _model.minData = [minTime floatValue];
    }
}

//时间循环
- (void)timerRunLoop{
    
    _time = 0;
    
    [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(timeMethod:) userInfo:nil repeats:YES];
}

//实现时间循环调用方法
- (void)timeMethod:(NSTimer *)timer{
    
    ++_time;
    
    if (_time == 5) {
        
        [timer invalidate];
        
        _dayData = _model.dayData;
        
        _hourData = _model.hourData;
        
        _totalSec = _model.minData * 60 + _dayData * 24 * 60 + _hourData * 60;
        
        _min = _totalSec/60;
        
        _sec = _totalSec%60;
        
//        _sec = 30;
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(whLabelShow:) userInfo:nil repeats:YES];
        
    }
    
    [self setNeedsDisplay];
}

//显示label
- (void)whLabelShow:(NSTimer *)timer{
    
    if (_min != 0 && _sec == 0) {
        
        _min--;
        
        _sec = 60;
    }
    
    _sec--;
    
    if (_min == 0 && _sec == 0) {
        
        [timer invalidate];
        
        _addButton.hidden = NO;
        
        _timeLabel.hidden = YES;
        
        _imgV.hidden = NO;
        
        _tabBar = [self whMaskTabBar];
        
        _tabBar.tabBar.hidden = NO;
        
        [self whAddGesture];
    }
    
    _timeLabel.text = [NSString stringWithFormat:@"%02d:%02d",_min,_sec];
    
}

//添加手势
- (void)whAddGesture{
    
    UISwipeGestureRecognizer *swipL = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(whSwipGesture:)];
    
    swipL.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.window addGestureRecognizer:swipL];
    
    UISwipeGestureRecognizer *swipR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(whSwipGesture:)];
    
    swipR.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.window addGestureRecognizer:swipR];
}

//实现手势操作方法
- (void)whSwipGesture:(UISwipeGestureRecognizer *)swipG{
    
    if (swipG.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        //        NSLog(@"left");
        
        if (_tabBar.selectedIndex <3) {
            
            _tabBar.selectedIndex ++;
        }
    }
    
    if (swipG.direction == UISwipeGestureRecognizerDirectionRight) {
        
        //        NSLog(@"right");
        
        if (_tabBar.selectedIndex > 0) {
            
            _tabBar.selectedIndex --;
        }
    }
}

#pragma mark--------待写传值
/**
 *  传值 标注记录数
 *  由该处进行数据累加，然后存入本地
 *  由ThirdView获取该值，然后进行数据处理
 *  通过所占图形面积表示
 *
 *
 *  在ThirdView中创建一个时间循环事件，然后进行刷新Draw：Rect:
 *  建议时间为每秒刷新一次
 */

- (void)whWriteLocalValue{
    
    static int _iflag;
    
    NSDictionary  *dic = [PathOfFile whReceiveLocalDictionary];
    
    NSNumber *num = [dic objectForKey:@"flag"];
    
    _iflag = 1 +[num intValue];
    
    [dic setValue:@(_iflag) forKeyPath:@"flag"];
    
    NSString *filePath = [PathOfFile whFilePath];
    
    [dic writeToFile:filePath atomically:YES];
    
    [self whPushNotification];
}

//消息推送
- (void)whPushNotification{
    
    UILocalNotification *localNotificaty = [[UILocalNotification alloc] init];
    
    localNotificaty.alertBody = @"时间到";
    
    localNotificaty.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];
    
    localNotificaty.applicationIconBadgeNumber = 1;
    
    UIApplication *app = [UIApplication sharedApplication];
    
    [app scheduleLocalNotification:localNotificaty];
}


//倒计时圆画制
- (void)drawRect:(CGRect)rect {
    
    static float i = -1.0;
    
    if (_model.index) {
        
        i = -1;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat pointX = self.center.x;
    
    CGFloat pointY = self.center.y;
    
    CGContextAddArc(context, pointX, pointY, 100, -M_PI_2, M_PI_2 * i, 0);
    
    CGContextSetLineWidth(context, 5);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    [[UIColor redColor] setStroke];
    
    CGContextStrokePath(context);
    
    i++;
    
    if (i == 4.0) {
        
        i = -1;
    }
}

@end
