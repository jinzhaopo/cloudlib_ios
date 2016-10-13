//
//  BaseController.m
//  ios_cloudlib_app
//
//  Created by apple on 16-9-20.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "HttpHelper.h"
#import "BaseController.h"

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
        return;
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
    //第一种方法：mobile是根目录，name是文件名称，html是文件类型
    
    //NSString* path = [[NSBundle mainBundle] pathForResource:filePath ofType:@"html" inDirectory:nil];
    
    //[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]]]; //加载本地文件
    
    //第二种方法：直接填写图片名,   css文件名
    
    NSString *path = [[NSBundle mainBundle] pathForResource:filePath ofType:@"html"];
    
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSURL *baseURL = [NSURL fileURLWithPath:htmlString];
    
    [webView loadHTMLString:htmlString baseURL:baseURL];
    
}

@end
