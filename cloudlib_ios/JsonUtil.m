//
//  JsonUtil.m
//  cloudlib_ios
//
//  Created by apple on 16-10-12.
//  Copyright (c) 2016年 yundao. All rights reserved.
//


#import "JsonUtil.h"
#import "UserBean.h"
#import "StringHelper.h"

@implementation JsonUtil

+(UserBean *) paresJsonToUser:(NSString *)jsonData{
    UserBean *user=nil;
    NSArray  *array=[StringHelper splitWithMark:jsonData mark:@","];
    if([array count]){
        user=[[UserBean alloc] init];
        for(NSString *json in array){
            NSArray * keyValue=[StringHelper splitWithMark:json mark:@":"];
            NSString *key=keyValue[0];
            NSString *value=keyValue[1];
            value=[value stringByReplacingOccurrencesOfString:@"\\" withString:@""];
            value=[value stringByReplacingOccurrencesOfString:@"\"" withString:@""];
            value=[value stringByReplacingOccurrencesOfString:@" " withString:@""];
            if([key containsString:@"userId"])
                user.userId=[NSNumber numberWithLong:[value longLongValue]];
            else if ([key containsString:@"username"])
                user.userName=value;
            else if([key containsString:@"password"])
                user.password=value;
            else if([key containsString:@"schoolId"])
                user.schoolId=[NSNumber numberWithLong:[value longLongValue]];
            else if([key containsString:@"type"])
                user.type=[NSNumber numberWithInteger:[value intValue]];
            else if([key containsString:@"loginJudge"]){
                user.loginJudge=[NSNumber numberWithInteger:[value intValue]];
            }
            else if([key containsString:@"message"])
                user.message=value;
            else if([key containsString:@"barcode"])
                user.barcode=value;
            else if([key containsString:@"teacherId"])
                user.teacherId=[NSNumber numberWithLong:[value longLongValue]];
        }
    }
    return user;
}
@end