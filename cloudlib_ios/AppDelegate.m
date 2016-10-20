//
//  AppDelegate.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-9-28.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "IndexController.h"
#import "LoginSwitchController.h"
#import "UserDelegate.h"
#import "FactoryHelper.h"
#import "LoginInfoBean.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    
    UserDelegate *userDelegate=[FactoryHelper initFactoryHelperAndgetDBInstance:@"UserDelegate"];
    NSArray *array=[userDelegate queryAllUsers:@"User" coreSQL:@"1=1"];
    
    UIViewController *masterViewController = [[LoginSwitchController alloc] initWithNibName:@"LoginSwitchController" bundle:nil] ;
    
    if([array count]){
        User *user=array[0];
        [LoginInfoBean setLoginInfoProperties:user.userId barcode:user.barcode userName:user.userName password:user.password schoolId:user.schoolId type:user.type loginJudge:user.loginJudge schoolName:user.message];
        masterViewController=[[IndexController alloc]initWithNibName:@"IndexController" bundle:nil];
    }else{
        masterViewController=[[LoginSwitchController alloc]initWithNibName:@"LoginSwitchController" bundle:nil];
        
    }


    self.window.rootViewController = masterViewController;
    
    [self.window makeKeyAndVisible];//这行代码会让包含了视图控制器视图的Window窗口显示在屏幕上。
    
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
