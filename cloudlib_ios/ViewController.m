//
//  ViewController.m
//  cloudlib_ios
//
//  Created by apple on 16-10-18.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "ViewController.h"
#import "LoginInfoBean.h"
#import "UserDelegate.h"
#import "FactoryHelper.h"
#import "UserController.h"
#import "ComonDefine.h"
#import "IndexController.h"
#import "LoginSwitchController.h"

@interface ViewController()

@property(nonatomic,strong) IndexController *indexController;
@property(nonatomic,strong) LoginSwitchController *loginSwitchController;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [NSThread sleepForTimeInterval:1.5];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL) animated{
    [super viewDidAppear:animated];
    //如果用户已经登录，则跳过登录页，直接前往主页
    UserDelegate *userDelegate=[FactoryHelper initFactoryHelperAndgetDBInstance:@"UserDelegate"];
    NSArray *array=[userDelegate queryAllUsers:@"User" coreSQL:@"1=1"];
    if([array count]){
        User *user=array[0];
        [LoginInfoBean setLoginInfoProperties:user.userId barcode:user.barcode userName:user.userName password:user.password schoolId:user.schoolId type:user.type loginJudge:user.loginJudge schoolName:user.message];
        self.indexController=[[IndexController alloc]initWithNibName:@"IndexController" bundle:nil];
        [self presentViewController:self.indexController animated:YES completion:^{
        }];
    }else{
        //否则前往用户选择页
         self.loginSwitchController=[[LoginSwitchController alloc]initWithNibName:@"LoginSwitchController" bundle:nil];
        [self presentViewController:self.loginSwitchController animated:YES completion:nil];
    }
}
@end
