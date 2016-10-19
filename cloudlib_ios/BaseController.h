//
//  BaseController.h
//  ios_cloudlib_app
//
//  Created by apple on 16-9-20.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseController : UIViewController<UIWebViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>


/**在调用presentViewController方法的时候执行的返回操作***/
-(void) goBack4PresentViewController;
/**发送通知***/
-(void) sendNSNotificationCenter: (NSString*)postNotificationName and: (id)object and:(NSDictionary*) userInfo;
/**接收通知**/
-(void) receiveNSNotificationCenter:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;


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

/**加载本地html***/
-(void) loadLocationHtmlFile:(UIWebView*) webView and:(NSString*) filePath;

/**创建一个消息提示框 zhen 差不多放在中间***/
-(void) createMessage:(UILabel*) uiLabel and: (NSString*) message;


/***loading***/
-(void) loading;
/*****/
-(void) cleanLoading;

//更新app系统版本号
- (void) updateAppVersion;


@end