//
//  ThirdViewController.m
//  timeAlertT
//
//  Created by mac on 15-11-3小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import "ThirdViewController.h"
#import "SettingViewController.h"
#import "ThirdView.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ThirdView *thirdV = [[ThirdView alloc] initWithFrame:CGRectMake(0, 85, self.view.frame.size.width, self.view.frame.size.height - 85)];
    
    [self.view addSubview:thirdV];
}

//推出设置界面
- (IBAction)pushSetting:(UIButton *)sender {
    
    UIStoryboard *settingStotyBoard = [UIStoryboard storyboardWithName:@"SettingViewController" bundle:[NSBundle mainBundle]];
    
    UIViewController *settingVC = [settingStotyBoard instantiateInitialViewController];
    
//    SettingViewController *settingVC = [[SettingViewController alloc] init];
    
//    settingVC.view.backgroundColor = [UIColor grayColor];
    
    [self.navigationController pushViewController:settingVC animated:YES];
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
