//
//  SecondView.h
//  timeAlert
//
//  Created by mac on 15-11-2小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *maskButton;
@property (weak, nonatomic) IBOutlet UILabel *alertLabel;

@property (nonatomic, assign) float dayData;
@property (nonatomic, assign) float hourData;
@property (nonatomic, assign) float minData;

@end
