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

@interface LoginSwitchController ()

@property(nonatomic,strong) AdminController *adminController;

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

//------控键－－－－－－－－－－
//用户按钮事件

- (IBAction)userBt {
   
}

//管理员事件
- (IBAction)adminBt {
    //xib跳转
    self.adminController=[[AdminController alloc]initWithNibName:@"AdminController" bundle:nil];
    [self presentViewController:self.adminController animated:YES completion:^{
        
    }];
}
@end
