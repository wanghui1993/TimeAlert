//
//  Model.h
//  timeAlertT
//
//  Created by mac on 15-11-3小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, assign) float dayData;
@property (nonatomic, assign) float hourData;
@property (nonatomic, assign) float minData;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) float sectionOfday;
@property (nonatomic, assign) NSInteger flag;

+ (instancetype)shareInstance;

@end
