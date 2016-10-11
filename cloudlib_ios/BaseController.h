//
//  BaseController.h
//  ios_cloudlib_app
//
//  Created by apple on 16-9-20.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BaseController : UIViewController<UIWebViewDelegate>
- (void)loadWebView:(NSString *)urlString;


/***
 到某个页面通过某个xib
 */
-(void) go2ViewByXib:(UIViewController *)viewController and: (NSString *)viewName;
/***
 通过storyboard找到对应的view
 **/
-(void) go2ViewByStoryboard:(UIViewController *)viewController and: (NSString *)viewName;
/***
 回到上个页面
 */
-(void) backView;
/***
 加载xib
 */
-(UIView*) loadXIB:(NSString *) xibName and:(UIViewController *)viewController;

/**
 *被网络调用的方法  每个继承的controller必须重写这个方法
 *
 **/
-(void) httpAction:(int) what and: (NSData *)  data and: (NSURLResponse * )  response and: (NSError *)  error;
@end