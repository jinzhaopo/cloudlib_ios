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

@property(nonatomic,strong) UILabel *loadLabel;



@end

@implementation BaseController

/**在调用presentViewController方法的时候执行的返回操作***/
-(void) goBack4PresentViewController{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

/**发送通知***/
-(void) sendNSNotificationCenter: (NSString*)postNotificationName and: (id)object and:(NSDictionary*) userInfo{
    [[NSNotificationCenter defaultCenter] postNotificationName:postNotificationName object:object userInfo:userInfo];
}
/**接收通知**/
-(void) receiveNSNotificationCenter:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:aSelector name:aName object:anObject];

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
        [self createMessage:self.uiLabel and:@"网络链接错误"];
        
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
    CGFloat msgH = 30;
    CGFloat msgX = (viewW - msgW) / 2;
    CGFloat msgY = (viewH - msgH) / 2;
    
    uiLabel.frame = CGRectMake(msgX, msgY, msgW, msgH);
    
    
    uiLabel.alpha = 0.0;
    uiLabel.textColor = [UIColor whiteColor];
    uiLabel.textAlignment = NSTextAlignmentCenter;
    uiLabel.font = [UIFont boldSystemFontOfSize:17];
    
    
    //设置圆角
    uiLabel.layer.cornerRadius = 9;
    uiLabel.layer.masksToBounds = YES;
    
    
    //实现动画
    [UIView animateWithDuration:3 animations:^{
        uiLabel.alpha = 0.6;
    } completion:^(BOOL finished) {
        
        //TODO 不知道为什么
        if(finished){
            //隔一段时间再启动另外一个动画
            [UIView animateWithDuration:1.5 delay:1.0 options:
             UIViewAnimationOptionCurveLinear animations:^{
                 //隐藏
                 uiLabel.alpha = 0;
             } completion:^(BOOL finished) {
                 //移除
                 [uiLabel removeFromSuperview];
             }];
            
        }
    }];
    
    [self.view addSubview:uiLabel];
}
/***loading**/
-(void) loading{
    if(self.loadLabel == nil){
        self.loadLabel = [[UILabel alloc] init];
    }
    self.loadLabel.text = @"加载中...";//设置提示消息
    
    self.loadLabel.backgroundColor = [UIColor blackColor];//设置背景颜色
    
    //设置frame
    CGFloat viewW = self.view.frame.size.width;
    CGFloat viewH = self.view.frame.size.height;
    
    CGFloat msgW = 80;
    CGFloat msgH = 80;
    CGFloat msgX = (viewW - msgW) / 2;
    CGFloat msgY = (viewH - msgH) / 2;
    
    self.loadLabel.frame = CGRectMake(msgX, msgY, msgW, msgH);
    
    
    self.loadLabel.alpha = 0.0;
    self.loadLabel.textColor = [UIColor whiteColor];
    self.loadLabel.textAlignment = NSTextAlignmentCenter;
    self.loadLabel.font = [UIFont boldSystemFontOfSize:17];
    
    
    //设置圆角
    self.loadLabel.layer.cornerRadius = 9;
    self.loadLabel.layer.masksToBounds = YES;
    
    
    //实现动画
    [UIView animateWithDuration:0.5 animations:^{
        self.loadLabel.alpha = 0.6;
    } completion:^(BOOL finished) {
        
    }];
    
    [self.view addSubview:self.loadLabel];
    
}


-(void) cleanLoading{
    //隔一段时间再启动另外一个动画
    [UIView animateWithDuration:0.5 delay:1.0 options:
     UIViewAnimationOptionCurveLinear animations:^{
         //隐藏
         self.loadLabel.alpha = 0;
     } completion:^(BOOL finished) {
         //移除
         [self.loadLabel removeFromSuperview];
     }];
}
//更新app系统版本号
- (void) updateAppVersion{
    AppUpdateDelegate *aud=[[AppUpdateDelegate alloc] init];
    UIAlertView *alert=[aud alertUpdateApp];
    [aud alertView:alert clickedButtonAtIndex:alert.cancelButtonIndex];

}
@end
