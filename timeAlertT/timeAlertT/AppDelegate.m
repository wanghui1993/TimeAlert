//
//  AppDelegate.m
//  timeAlertT
//
//  Created by mac on 15-11-3小郎.
//  Copyright © 2015年 wh. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ThirdView.h"

@interface AppDelegate ()
{
    UITabBarController *_tabBar;
    
    SecondViewController *secVC;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建UIWindow
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //设置背景色
    window.backgroundColor = [UIColor whiteColor];
    self.window = window;
    //设置为主窗口
    [self.window makeKeyAndVisible];
    
    [self whTabBarViewController];
    
    [self whRegistNotification];
    
    [self whAddGesture];
    
    return YES;
}

//创建tabBarController
- (void)whTabBarViewController{
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    
    secVC = [[SecondViewController alloc] init];
    
    UINavigationController *nav = [self whNavigationVontroller];
    
    _tabBar = [[UITabBarController alloc] init];
    
    _tabBar.viewControllers = @[firstVC,secVC,nav];
    
    _tabBar.selectedIndex = 1;
    
    self.window.rootViewController = _tabBar;
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
    
    if (secVC.addBtn.hidden) {
        
        [self.window removeGestureRecognizer:swipG];
        
        return;
    }
    
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

//创建第三界面导航控制器
- (UINavigationController *)whNavigationVontroller{
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    
    nav.navigationBarHidden = YES;
    
    return nav;
}


//注册推送
- (void)whRegistNotification
{
    
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:nil];
    
    UIApplication *app = [UIApplication sharedApplication];
    
    [app registerUserNotificationSettings:setting];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
