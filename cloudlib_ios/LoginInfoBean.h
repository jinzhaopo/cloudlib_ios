//
//  LoginInfoBean.m
//  cloudlib_ios
//
//  Created by apple on 16-10-12.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginInfoBean : NSObject
+(NSDictionary *) getLoginInfo:(NSDictionary *)dic;
-(void) setLoginInfoProperties:(NSNumber *)userId barcode:(NSString *)barcode userName:(NSString *)userName password:(NSString *)password schoolId:(NSNumber *)schoolId type:(NSNumber *)type loginJudge:(NSNumber *)loginJudge schoolName:(NSString *)schoolName;
@end