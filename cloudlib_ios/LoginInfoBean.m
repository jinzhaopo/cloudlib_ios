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
+(NSDictionary *) getLoginInfo{
    return _dic;
}

+(void) setLoginInfo:(NSDictionary *)dic{
    _dic=dic;
}

+(void) setLoginInfoProperties:(NSNumber *)userId barcode:(NSString *)barcode userName:(NSString *)userName password:(NSString *)password schoolId:(NSNumber *)schoolId type:(NSNumber *)type loginJudge:(NSNumber *)loginJudge schoolName:(NSString *)schoolName{
    _dic=[NSDictionary dictionaryWithObjects:@[userId,barcode,userName,password,schoolId,type,loginJudge,schoolName]
                                forKeys:@[@"userId",@"barcode",@"userName",@"password",@"schoolId",@"type",@"loginJudge",@"schoolName"]];
}
@end
