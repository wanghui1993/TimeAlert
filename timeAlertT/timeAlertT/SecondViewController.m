//
//  SecondViewController.m
//  timeAlertT
//
//  Created by mac on 15-11-3小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondView.h"
#import "Model.h"

@interface SecondViewController ()
{
    SecondView *_secV;
    
    Model *_model;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _secV = [[[NSBundle mainBundle] loadNibNamed:@"SecondView" owner:nil options:nil] lastObject];
    
    _addBtn = _secV.addButton;
    
    [self.view addSubview:_secV];
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
