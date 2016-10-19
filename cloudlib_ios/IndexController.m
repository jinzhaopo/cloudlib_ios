//
//  IndexController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-9.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "IndexController.h"
#import "LoginInfoBean.h"
#import "SettingController.h"

@interface IndexController ()

@property(nonatomic,strong) SettingController* settingController;

/**action***/
- (IBAction)settingAction:(id)sender;

/***view**/
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation IndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLocationHtmlFile:self.webView and:@"/index.html"];
    [self updateAppVersion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


- (IBAction)settingAction:(id)sender {
    //xib 跳转
    self.settingController=[[SettingController alloc]initWithNibName:@"SettingController" bundle:nil];
    [self presentViewController:self.settingController animated:YES completion:^{
        
    }];
}
@end
