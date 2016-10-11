//
//  StringHelper.m
//  ios_cloudlib_app
//
//  Created by apple on 16-9-20.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "StringHelper.h"
@implementation StringHelper

+(bool) isNotBlank:(NSString *)strSource{
    return strSource!=nil && ![strSource isEqualToString:@""];
}

+(NSString *)substringFromIndexToIndex:
(NSString *)strSource
                                  from:(NSInteger)fromIndex to:(NSInteger) toIndex{
    if([StringHelper isNotBlank:strSource]){
        strSource=[strSource substringFromIndex:fromIndex];
        strSource=[strSource substringToIndex:toIndex-fromIndex];
        return strSource;
    }
    return nil;
}

+ (NSMutableArray *)splitWithMark:(NSString *)strSource mark:(NSString *)mark{
    if(strSource==nil || ![strSource containsString:mark])
        return nil;
    NSMutableArray *array=[[NSMutableArray alloc] init];
    NSInteger index=[strSource rangeOfString:mark].location;
    NSInteger aryIndex=-1;
    while(index!=NSNotFound){
        array[++aryIndex]=[strSource substringToIndex:index];
        strSource=[strSource substringFromIndex:index+1];
        index=[strSource rangeOfString:mark].location;
    }
    array[++aryIndex]=strSource;
    return array;
}
/***判断字符串是不是null或者是空串**/
+(BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    
    return NO;
}

@end