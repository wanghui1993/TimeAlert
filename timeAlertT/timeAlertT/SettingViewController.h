//
//  SettingViewController.h
//  timeAlertT
//
//  Created by mac on 15-11-3小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISlider *dayDataSlide;
@property (weak, nonatomic) IBOutlet UISlider *hourDataSlide;
@property (weak, nonatomic) IBOutlet UISlider *minDataSlide;
@property (weak, nonatomic) IBOutlet UISlider *breakDataSlide;
@property (weak, nonatomic) IBOutlet UISlider *totalNumberSlide;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
@property (weak, nonatomic) IBOutlet UILabel *sectionDayLabel;

@end
