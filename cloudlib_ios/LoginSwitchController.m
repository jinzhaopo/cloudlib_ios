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
#import "UserController.h"

@interface LoginSwitchController ()

@property(nonatomic,strong) AdminController *adminController;
@property(nonatomic,strong) UserController *userController;

@property(nonatomic,strong) IndexController *indexController;


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
 
}
//------控键－－－－－－－－－－

//用户按钮事件
- (IBAction)userBt:(id)sender {
    //xib 跳转
    self.userController=[[UserController alloc]initWithNibName:@"UserController" bundle:nil];
    [self presentViewController:self.userController animated:YES completion:^{
        
    }];
}
//管理员事件
- (IBAction)adminBt:(id)sender {
    //xib跳转
    self.adminController=[[AdminController alloc]initWithNibName:@"AdminController" bundle:nil];
    [self presentViewController:self.adminController animated:YES completion:^{
        
    }];
}
@end


