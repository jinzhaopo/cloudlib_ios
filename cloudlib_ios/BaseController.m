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
@end
