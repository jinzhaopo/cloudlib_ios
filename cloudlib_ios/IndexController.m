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
#import <JavaScriptCore/JavaScriptCore.h>

@interface IndexController ()

@property(nonatomic,strong) SettingController* settingController;

/**action***/
/**设置**/
- (IBAction)settingAction:(id)sender;

/**本来是查询的现在变成扫一扫**/
- (IBAction)scanAction:(id)sender;

/***view**/
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UITabBar *tabBarView;

@end

@implementation IndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLocationHtmlFile:self.webView and:@"/index.html"];
    [self updateAppVersion];
    
    //1.默认第一个被选中
    NSArray *items = self.tabBarView.items;
    self.tabBarView.selectedItem = items[0];
    
//    JSContext *content = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    content[@"bdgt"] = ^() {
//        NSLog(@"js调用oc---------begin--------");
//        NSArray *thisArr = [JSContext currentArguments];
//        for (JSValue *jsValue in thisArr) {
//            NSLog(@"=======%@",jsValue);
//        }
//        NSLog(@"js调用oc---------The End-------");
//       
//    };
//
    
}

#pragma mark -- UITabBarDelegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)Item{
    long index = (unsigned long)[tabBar.items indexOfObject:Item];
    if(index == 0){
        //主页
        
    }else if(index == 1){
        //查询
        
    }else if(index == 2){
        //我的云图
        
    }
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"oc调用js获取值");
    NSMutableString *js = [NSMutableString string];
    [js appendString:[NSString stringWithFormat:@"send('%@');", @"这是测试传值"]];
    [self.webView stringByEvaluatingJavaScriptFromString:js];

}

/*****组件***/
- (IBAction)settingAction:(id)sender {
    //xib 跳转
    self.settingController=[[SettingController alloc]initWithNibName:@"SettingController" bundle:nil];
    [self presentViewController:self.settingController animated:YES completion:^{
        
    }];
}

- (IBAction)scanAction:(id)sender {
   }
@end
