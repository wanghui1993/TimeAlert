//
//  Model.m
//  timeAlertT
//
//  Created by mac on 15-11-3小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import "Model.h"

@implementation Model


+ (instancetype)shareInstance{
    
    static Model *model = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        model = [[Model alloc] init];
    });
    
    return model;
}


- (void)setDayData:(float)dayData{
    
    _dayData = dayData;
    
    NSLog(@"model Class %.2f",_dayData);
}

- (void)setHourData:(float)hourData{
    
    _hourData = hourData;
}

- (void)setMinData:(float)minData{
    
    _minData = minData;
}

- (void)setSectionOfday:(float)sectionOfday{
    
    _sectionOfday = sectionOfday;
}

@end
