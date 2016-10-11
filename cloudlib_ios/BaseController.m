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
- (void)loadWebView:(NSString *)urlString{
    UIWebView *webView=[[UIWebView alloc] initWithFrame:self.view.frame];
    webView.delegate=self;
    [self.view addSubview:webView];
    //NSMutableURLRequest *request=[HttpHelper initRequestWithUrl:urlString];
    //[webView loadRequest:request];
    
    //NSString *path = @"/ios_project/苹果页面备份/html/index.html";
    NSString *htmlString = [NSString stringWithContentsOfFile:urlString encoding:NSUTF8StringEncoding error:nil];
    
    NSURL *url=[NSURL URLWithString:urlString];
    [webView loadHTMLString:htmlString baseURL:url];
}


/***
 到某个页面
 */
-(void) go2ViewByXib:(UIViewController *)viewController and: (NSString *)viewName{
    //获取view
    viewController.view = [self loadXIB:viewName and:viewController];
    
    //现在开启动画
    [self presentViewController:viewController animated:true completion:nil];
    
}

/***通过storyboard找到对应的view**/
-(void) go2ViewByStoryboard:(UIViewController *)viewController and: (NSString *)viewName{
    
}
/***
 回到上个页面
 */
-(void) backView{
    
    //返回到之前的视图控制器
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
@end
