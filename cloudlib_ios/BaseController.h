//
//  BaseController.h
//  ios_cloudlib_app
//
//  Created by apple on 16-9-20.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseController : UIViewController<UIWebViewDelegate>

/**在调用presentViewController方法的时候执行的返回操作***/
-(void) goBack4PresentViewController;

/***
 加载xib
 */
-(UIView*) loadXIB:(NSString *) xibName and:(UIViewController *)viewController;

/**
 *被网络调用的方法  每个继承的controller必须重写这个方法
 *
 **/
-(void) httpAction:(int) what and: (NSData *)  data and: (NSURLResponse * )  response and: (NSError *)  error;

/****判断网络是否链接****/
-(void) netISOpen:(NSError*)  error;

/*****页面重新载入*/
-(void) reloadDidPush: (UIWebView*) webView;

/*****停止载入*/
-(void) stopDidPush: (UIWebView*) webView;

/*****返回*/
-(void) backDidPush: (UIWebView*) webView;

/*****前进*/
-(void) forwardDidPush: (UIWebView*) webView;



@end