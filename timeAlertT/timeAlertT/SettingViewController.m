//
//  SettingViewController.m
//  timeAlertT
//
//  Created by mac on 15-11-3小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import "SettingViewController.h"
#import "Model.h"
#import "pathOfFile.h"

@interface SettingViewController ()
{
    Model *_model;
    
    NSMutableDictionary *_dic;
}

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _model = [Model shareInstance];
    
    [self whQuitValue];
    
    [self whHeadView];
    
    [self whButton];
}

//判断是否有选定值
- (void)whQuitValue{
    
    NSString *filePath = [PathOfFile whFilePath];
    
    NSDictionary *recodeDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSNumber *dayTime = [recodeDic objectForKey:@"dayTime"];
    
    NSNumber *hourTime = [recodeDic objectForKey:@"houtTime"];
    
    NSNumber *minTime = [recodeDic objectForKey:@"minTime"];
    
    NSNumber *totalTime = [recodeDic objectForKey:@"sectionOfDay"];
    
    if (dayTime || hourTime || minTime) {
        
        _dayDataSlide.value = [dayTime floatValue];
        
        _hourDataSlide.value = [hourTime floatValue];
        
        _minDataSlide.value = [minTime floatValue];
        
        _totalNumberSlide.value = [totalTime floatValue];
        
        _dayLabel.text = [NSString stringWithFormat:@"%.f天",_dayDataSlide.value];
        
        _hourLabel.text = [NSString stringWithFormat:@"%.f小时",_hourDataSlide.value];
        
        _minLabel.text = [NSString stringWithFormat:@"%.f分钟",_minDataSlide.value];
        
        _sectionDayLabel.text = [NSString stringWithFormat:@"%.f组",_totalNumberSlide.value];
    }
}

//天数slide
- (IBAction)dayAction:(UISlider *)sender {
    
    _dayLabel.text = [NSString stringWithFormat:@"%.f天",sender.value];
}

//小时slide
- (IBAction)hourTimeAction:(UISlider *)sender {
    
    _hourLabel.text = [NSString stringWithFormat:@"%.f小时",sender.value];
}

//分钟slide
- (IBAction)minTimeAction:(UISlider *)sender {
    
    _minLabel.text = [NSString stringWithFormat:@"%.f分钟",sender.value];
}

//每天组数
- (IBAction)sectionDay:(UISlider *)sender {
    
    _sectionDayLabel.text = [NSString stringWithFormat:@"%.f组",_totalNumberSlide.value];
}

//创建headView
- (void)whHeadView{
    
    self.tableView.bounces = NO;
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(30, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    
    self.tableView.tableHeaderView = headView;
}

//创建按键
- (void)whButton{
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 5, 50, 50)];
    
    NSString *str = @"返回";
    
    NSAttributedString *attriStr = [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    [btn setAttributedTitle:attriStr forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(buttonDo:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

//实现方法
- (void)buttonDo:(UIButton *)button{
    
    _model.dayData = _dayDataSlide.value;
    
    _model.hourData = _hourDataSlide.value;
    
    _model.minData = _minDataSlide.value;
    
    _model.sectionOfday = _totalNumberSlide.value;
    
    _model.index = 2;
    
    NSString *day = [NSString stringWithFormat:@"%.f",_dayDataSlide.value];
    
    NSString *hour = [NSString stringWithFormat:@"%.f",_hourDataSlide.value];
    
    NSString *min = [NSString stringWithFormat:@"%.f",_minDataSlide.value];
    
    NSString *section = [NSString stringWithFormat:@"%.f",_totalNumberSlide.value];
    
    NSNumber *dayTime = @([day floatValue]);
    
    NSNumber *hourTime = @([hour floatValue]);
    
    NSNumber *minTime = @([min floatValue]);
    
    NSNumber *totalNumber = @([section floatValue]);
    
    //创建字典
    _dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:dayTime,@"dayTime",hourTime,@"houtTime",minTime,@"minTime",totalNumber,@"sectionOfDay", nil];
    
    NSString *filePath = [PathOfFile whFilePath];
    
    [_dic writeToFile:filePath atomically:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
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
