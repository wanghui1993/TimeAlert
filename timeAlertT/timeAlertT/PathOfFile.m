//
//  pathOfFile.m
//  timeAlertT
//
//  Created by mac on 15-11-4小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import "PathOfFile.h"

@implementation PathOfFile

//创建文件路径
+ (NSString *)whFilePath{
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];;
    
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"recode.plist"];
    
//    NSLog(@"%@",filePath);
    
    return filePath;
}

+ (NSDictionary *)whReceiveLocalDictionary{
    
    NSString *filePath = [self whFilePath];
    
    NSDictionary  *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    return dic;
}

@end
