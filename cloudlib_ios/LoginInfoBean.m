//
//  LoginInfoBean.m
//  cloudlib_ios
//
//  Created by apple on 16-10-12.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "LoginInfoBean.h"
@implementation LoginInfoBean
static NSDictionary *_dic;
//获取登录后的信息
+(NSDictionary *) getLoginInfo:(NSDictionary *)dic{
    
    if(_dic==nil){
        _dic=dic;
    }
    return _dic;
}

//设置登录信息属性
-(void) setLoginInfoProperties:(NSNumber *)userId barcode:(NSString *)barcode userName:(NSString *)userName password:(NSString *)password schoolId:(NSNumber *)schoolId type:(NSNumber *)type loginJudge:(NSNumber *)loginJudge schoolName:(NSString *)schoolName{
    [_dic setValue:userId forKey:@"userId"];
    [_dic setValue:barcode forKey:@"barcode"];
    [_dic setValue:userName forKey:@"userName"];
    [_dic setValue:password forKey:@"password"];
    [_dic setValue:schoolId forKey:@"schoolId"];
    [_dic setValue:type forKey:@"type"];
    [_dic setValue:loginJudge forKey:@"loginJudge"];
    [_dic setValue:schoolName forKey:@"schoolName"];
}
@end
