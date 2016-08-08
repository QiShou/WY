//
//  AppDelegate.m
//  Weibo
//
//  Created by wangyi on 16/8/1.
//  Copyright © 2016年 wangyi. All rights reserved.
//

#import "AppDelegate.h"
#import "WYHomeViewController.h"
#import "WYNewFeatureViewController.h"
#define key_ShortVersion @"key_ShortVersion"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 1  获取主界面
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //1.1本地保存的版本号
   //通过可以去除对应的内容
    NSString *localShortVersionStr = [[NSUserDefaults standardUserDefaults] objectForKey:key_ShortVersion];
    NSLog(@"%@",localShortVersionStr);
    
    // 1.2 取出当前版本号码
    NSString *currectShortVersionStr = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSLog(@"%@",currectShortVersionStr);
    /*!
     判断当前本地保存的版本号为空 或者本地版本号小于当前 app 版本号 就直接进入新特性页面
     
     
     - returns: <#return value description#>
     */
    if (localShortVersionStr || [localShortVersionStr compare:currectShortVersionStr] == NSOrderedAscending) {
        //进入新特性控制器之前保存当前的 app 的版本号 以便下次进入的时候判断
        [[NSUserDefaults standardUserDefaults] setObject:currectShortVersionStr forKey:key_ShortVersion];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.window.rootViewController = [[WYNewFeatureViewController alloc] init];
    } else {
    
        
    }
    //2 设置
    WYHomeViewController *homeCon = [[WYHomeViewController alloc] init];
    self.window.rootViewController = homeCon;
    
    [self.window makeKeyAndVisible];
    
    return YES;
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
