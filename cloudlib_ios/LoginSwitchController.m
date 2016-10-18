//
//  LoginSwitchController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-9-28.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "LoginSwitchController.h"
#import "AdminController.h"
#import "IndexController.h"
#import "LoginInfoBean.h"
#import "UserDelegate.h"
#import "FactoryHelper.h"
#import "UserController.h"
#import "ComonDefine.h"

@interface LoginSwitchController ()

@property(nonatomic,strong) AdminController *adminController;
@property(nonatomic,strong) UserController *userController;

@property(nonatomic,strong) IndexController *indexController;
//---控件---
/**用户按钮*/
- (IBAction)userBt;

/**管理员按钮*/
- (IBAction)adminBt;


@end

@implementation LoginSwitchController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    /*
    //如果用户已经登录，则跳过登录页，直接前往主页
    UserDelegate *userDelegate=[FactoryHelper initFactoryHelperAndgetDBInstance:@"UserDelegate"];
    NSArray *array=[userDelegate queryAllUsers:@"User" coreSQL:@"1=1"];
    if([array count]){
        User *user=array[0];
        [LoginInfoBean setLoginInfoProperties:user.userId barcode:user.barcode userName:user.userName password:user.password schoolId:user.schoolId type:user.type loginJudge:user.loginJudge schoolName:user.message];
        self.indexController=[[IndexController alloc]initWithNibName:@"IndexController" bundle:nil];
        [self presentViewController:self.indexController animated:YES completion:^{
        }];
    }*/
}
//------控键－－－－－－－－－－
//用户按钮事件

- (IBAction)userBt {
    //xib 跳转
    self.userController=[[UserController alloc]initWithNibName:@"UserController" bundle:nil];
    [self presentViewController:self.userController animated:YES completion:^{
        
    }];
   
}

//管理员事件
- (IBAction)adminBt {
    //xib跳转
    self.adminController=[[AdminController alloc]initWithNibName:@"AdminController" bundle:nil];
    [self presentViewController:self.adminController animated:YES completion:^{
        
    }];
}
@end

