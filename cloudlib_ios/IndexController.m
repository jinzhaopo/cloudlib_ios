//
//  IndexController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-9.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "IndexController.h"
#import "LoginInfoBean.h"

@interface IndexController ()

/*****/
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation IndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLocationHtmlFile:self.webView and:@"/index.html"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
