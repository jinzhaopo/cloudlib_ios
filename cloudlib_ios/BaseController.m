//
//  BaseController.m
//  ios_cloudlib_app
//
//  Created by apple on 16-9-20.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "HttpHelper.h"
#import "BaseController.h"
#import "AppUpdateDelegate.h"
@interface BaseController ()

@property(nonatomic,strong) UILabel* uiLabel;


@end

@implementation BaseController

/**在调用presentViewController方法的时候执行的返回操作***/
-(void) goBack4PresentViewController{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/***
 加载xib
 */
-(UIView*) loadXIB:(NSString *) xibName and:(UIViewController *)viewController{
    
    //获取root目录
    NSBundle *bundle = [NSBundle mainBundle];
    
    //加载xib   不带后缀
    UIView *view = nil;
    if(viewController == nil){
        
        view = [[bundle loadNibNamed:xibName owner:nil options:nil ] lastObject];
    }else{
        
        view = [[bundle loadNibNamed:xibName owner:viewController options:nil ] lastObject];
    }
    
    
    return view;
}

/**
 *被网络调用的方法  每个继承的controller必须重写这个方法
 *
 **/
-(void) httpAction:(int) what and: (NSData *)  data and: (NSURLResponse * )  response and: (NSError *)  error{
    
    
}

/****判断网络是否链接****/
-(void) netISOpen:(NSError*)  error{
    if(error != nil){
        NSLog(@"网络链接错误");
      
    }
}

/*****页面重新载入*/
-(void) reloadDidPush: (UIWebView*) webView{
    [webView reload];
}

/*****停止载入*/
-(void) stopDidPush: (UIWebView*) webView{
    [webView stopLoading];
}

/*****返回*/
-(void) backDidPush: (UIWebView*) webView{
    [webView goBack];
}

/*****前进*/
-(void) forwardDidPush: (UIWebView*) webView{
    [webView goForward];
}

/**加载本地html***/
-(void) loadLocationHtmlFile:(UIWebView*) webView and:(NSString*) filePath;{
    
    NSString *bundleFile = [[NSBundle mainBundle] pathForResource:@"html" ofType:nil];
    NSString *htmlFile = [bundleFile stringByAppendingPathComponent:filePath];
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    [webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL fileURLWithPath:bundleFile]];
    //NSString *aaa = [_webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"];
    //NSLog(@"aaa:%@",aaa);
    
}

/**创建一个消息提示框 zhen 差不多放在中间***/
-(void) createMessage:(UILabel*) uiLabel and: (NSString*) message{
    if(uiLabel == nil){
        uiLabel = [[UILabel alloc] init];
    }
    uiLabel.text = message;//设置提示消息
    
    uiLabel.backgroundColor = [UIColor blackColor];//设置背景颜色
    
    //设置frame
    CGFloat viewW = self.view.frame.size.width;
    CGFloat viewH = self.view.frame.size.height;
    
    CGFloat msgW = 200;
    CGFloat msgH = 200;
    CGFloat msgX = (viewW - msgW) / 2;
    CGFloat msgY = (viewH - msgH) / 2;
    
    uiLabel.frame = CGRectMake(msgX, msgY, msgW, msgH);
    
    uiLabel.textColor = [UIColor whiteColor];
    uiLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:uiLabel];
}

//更新app系统版本号
- (void) updateAppVersion{
    AppUpdateDelegate *aud=[[AppUpdateDelegate alloc] init];
    UIAlertView *alert=[aud alertUpdateApp];
    [aud alertView:alert clickedButtonAtIndex:alert.cancelButtonIndex];
}
@end
