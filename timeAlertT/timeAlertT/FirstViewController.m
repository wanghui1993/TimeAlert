//
//  FirstViewController.m
//  timeAlertT
//
//  Created by mac on 15-11-3小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataList;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic ,copy) UITextField *textFile;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化字典对象dataList
    _dataList = [NSMutableArray array];
    
    NSString *filePath = [self whFilePath];
    
    NSArray *dataListfile = [NSArray arrayWithContentsOfFile:filePath];
    
//    NSLog(@"%@",dataListfile);
    
    //判断是否存在任务
    if (dataListfile) {
        
        _dataList = [NSMutableArray arrayWithArray:dataListfile];
    }
    
}


//任务添加按钮点击事件
- (IBAction)addTask:(UIButton *)sender {
    
    UIAlertController *alertC = [self whAlertController];
    
    [self presentViewController:alertC animated:YES completion:nil];
}

//添加警示栏
- (UIAlertController *)whAlertController{
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"name" message:@"aaaaa" preferredStyle:UIAlertControllerStyleAlert];
    
       [alertC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
    
          textField.placeholder = @"请输入任务";
       }];
    
    UIAlertAction *alertACancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *alertASure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"确定后执行");
        
        _textFile = [alertC.textFields firstObject];
        
        [_dataList addObject:[NSString stringWithFormat:@"%@",_textFile.text]];
        
        NSString *filePath = [self whFilePath];
        
        [_dataList writeToFile:filePath atomically:YES];
        
        [_tableView reloadData];
        
    }];
    
    [alertC addAction:alertASure];
    
    [alertC addAction:alertACancel];
    
    return alertC;
}

//创建文件路径
- (NSString *)whFilePath{
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];;
    
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"dataList.plist"];
    
//    NSLog(@"%@",filePath);
    
    return filePath;
}

#pragma mark---------代理-----------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSString *str = _dataList[indexPath.row];
    
    cell.textLabel.text = str;
    
    cell.textLabel.textColor = [UIColor redColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 30;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [_dataList removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
}

@end
