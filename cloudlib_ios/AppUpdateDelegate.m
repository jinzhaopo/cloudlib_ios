//
//  AlertDelegate.m
//  cloudlib_ios
//
//  Created by apple on 16-10-17.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "AppUpdateDelegate.h"
#import "ComonDefine.h"

@implementation AppUpdateDelegate
//http://www.2cto.com/kf/201501/368967.html

- (UIAlertView *)alertUpdateApp{
    NSString * string = [NSString stringWithContentsOfURL:[NSURL URLWithString:D_APP_STORE_URL] encoding:NSUTF8StringEncoding error:nil];
    if (string != nil &&[string length]>0 &&[string rangeOfString:@"Version"].length == 7) {
       return [self Postpath:string];
    }
    return nil;
}
// 解析url，获取当前在服务器上面的版本号
- (UIAlertView *)Postpath:(NSString *)appInfo{
    UIAlertView *alertView=nil;
    //获取本地的版本号
    NSString * version = [[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleVersion"];
    //截取出url上面的版本号
    NSString * appInfo1 = [appInfo substringFromIndex:[appInfo rangeOfString:@"\"version\":"].location+10];
    appInfo1 = [[[appInfo1 substringToIndex:[appInfo rangeOfString:@","].location]stringByReplacingOccurrencesOfString:@"\"" withString:@""]componentsSeparatedByString:@","][0];
    if (![appInfo1 isEqualToString:version]) {
        alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"发现新版本，需要升级么？" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];     alertView.tag = 999;
        [alertView show];
    }else{
        alertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"已经是最新版本了" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alertView show];
    }
    return alertView;
}

//alertView的代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==999){
        if(buttonIndex==0) {
            [self updateApp];
        }
        else{
            [alertView dismissWithClickedButtonIndex:1 animated:YES];
        };
    }
}
//更新app
-(void)updateApp{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:D_APP_UPDATE_URL
                                                ]];
}
@end